require_relative "bdense.rb"

##
#  Generic module for computing a pipelined binarized neural network.
########################################################################



# System implementing a pipelined binarized neuronal network for
# generic input bit vector +vecX+ and set of outputs the result to set
# binarized values +as+.
#
# NOTE: binarized values are 0 for -1 and 1 for +1
#
# Generic arguments:
# - +typ+ is the type of the input vector or the number
#   of bits of the vectors.
# - +lwidth+ the input width of the LUT of the LUT layers of the popcount.
# - +weight_bias_sets+ the set of weights and bias values layer by layer
system :bnn_pipe do |typ, lwidth = 4, weights_bias_sets|
    # Ensure typ is a type.
    typ = bit[typ] unless typ.is_a?(Htype)
    # Ensure the weight and bias set is of the right shape and contains
    # valid values.
    weights_bias_sets = weights_bias_sets.map do |weights_bias_set|
        weights_bias_set.map do |weights,bias|
            [weights.to_expr, bias.to_expr]
        end
    end

    # Get the number of layers from the number of entries in the sets of
    # weigths and biases.
    numL = weights_bias_sets.size
    # puts "numL=#{numL}"

    # Declare teh input clock and reset.
    input :clk,:rst

    # Declare the input vector.
    typ.input :vecX

    # Declares the pipeline registers and the output.
    # The store the outputs (a) of each layer.
    regs = []
    numL.times do |i|
        sizeA = weights_bias_sets[i].size
        if (i == numL-1) then
            regs << [sizeA].output(:"reg#{i}")
        else
            regs << [sizeA].inner(:"reg#{i}")
        end
    end
    # Declares the connection points
    pts = []
    numL.times do |i|
        sizeA = weights_bias_sets[i].size
        puts "i=#{i} sizeA=#{sizeA}"
        pts << [sizeA].inner(:"pt#{i}")
    end

    # Instantiate and connect the neuron layers.
    cur_typ = typ
    numL.times do |i|
        puts "i=#{i} cur_typ.width=#{cur_typ.width}"
        puts "num = #{weights_bias_sets[i].size}"
        puts "pts[i].width=#{pts[i].width}"
        puts "([vecX]+regs)[i].width=#{([vecX]+regs)[i].width}"
        bdense(cur_typ,lwidth,weights_bias_sets[i]).(:"bdenseI#{i}").
            # (([vecX]+regs)[i],*pts[i])
            (([vecX]+regs)[i],*(pts[i].to_a.reverse))
        cur_typ = bit[weights_bias_sets[i].size]
    end

    # Handle the pipeline.
    par(clk.posedge) do
        hif (rst) do
            # Sets all the pipelie registers to 0.
            regs.each { |reg| reg <= 0 }
        end
        helse do
            # Performs a pipeline step.
            regs.each.with_index { |reg,i| reg <= pts[i] }
        end
    end

end


# System for testing the pipelined binarized neural network.
Unit.system :bnn_pipeTest do

    # The weights and biases by layer
    t_l_w_b = [
        # Layer 0
        [ [ _00000000000000000000000000000000, _000000 ],
          [ _00000000000000000000000000000001, _111000 ],
          [ _01010101010101010101010101010101, _001010 ],
          [ _11111111111111111111111111111110, _111101 ],
          [ _00000000000000000000000000000000, _111101 ],
          [ _00000000000000000000000000000001, _001010 ],
          [ _01010101010101010101010101010101, _111000 ],
          [ _11111111111111111111111111111110, _000000 ],

        ],
        # Layer 1
        [ 
          [ _01010101, _1101 ],
          [ _11111110, _0001 ]
        ],
        # Layer 2
        [ [ _00, _01 ],
          [ _01, _10 ],
          [ _11, _11 ],
          [ _10, _00 ]
        ],
    ]

    # 32-bit vectors for testing and their expected results.
    t_valX_expA = [
        [ _00000000000000000000000000000000, _1011 ],
        [ _00000000000000000000000000000001, _1011 ],
        [ _11100000011100000111101100000111, _1000 ],
        [ _01010101010101010101010101010101, _1011 ],
        [ _11100000011100000111101100001111, _1000 ],
        [ _10011100011000111000010000100001, _1011 ],
        [ _11111111111111111111111111111111, _1000 ],
        [ _00001111000011110111000111000111, _1011 ],
        [ _11110000001111110111110000011111, _1011 ]
    ]


    # The clock and reset.
    inner :clk, :rst

    # The input and output of of the neural network.
    [32].inner :vecX
    [4].inner :a

    # The BNN instance to test.
    bnn_pipe(bit[32],t_l_w_b).(:bnn_pipeI).(clk,rst,vecX,a)

    # For displaying the input and expected output
    [32].inner :vecX_v
    [4].inner :expA_v

    test do
        # Initialize the circuit.
        clk <= 0
        rst <= 0
        vecX <= 0
        !10.ns
        clk <= 1
        !10.ns
        clk <= 0
        rst <= 1
        !10.ns
        clk <= 1
        !10.ns
        clk <= 0
        rst <= 0
        !10.ns
        clk <= 1
        !10.ns
        # Set each vector.
        t_valX_expA.each do |(valX, expA)|
            clk <= 0
            vecX_v <= valX
            expA_v <= expA
            vecX <= valX
            !10.ns
            clk <= 1
            !10.ns
        end
        # Wait for the end of the pipeline.
        10.times do
            clk <= 0
            !10.ns
            clk <= 1
            !10.ns
        end
    end

end
