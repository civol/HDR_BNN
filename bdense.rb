require_relative "bneuron.rb"

##
#  Generic module for computing a dense layer of binarized neurons
########################################################################



# System implementing a dense layer of binarized neuron for
# generic input bit vector +vecX+ and set of outputs the result to set
# binarized values +as+.
#
# NOTE: binarized values are 0 for -1 and 1 for +1
#
# Generic arguments:
# - +typ+ is the type of the input vector or the number
#   of bits of the vectors.
# - +lwidth+ the input width of the LUT of the LUT layers of the popcount.
# - +weight_bias_set+ the set of weights and bias values
system :bdense do |typ, lwidth = 4, weights_bias_set|
    # Ensure typ is a type.
    typ = bit[typ] unless typ.is_a?(Htype)
    # Ensure the weight and bias set is of the right shape and contains
    # valid values.
    weights_bias_set = weights_bias_set.map do |weights,bias|
        [weights.to_expr, bias.to_expr]
    end
    # Get the number of vectors from the number of entries in the set of
    # weigths and biases.
    num = weights_bias_set.size

    # Declare the input and outputs.
    typ.input :vecX
    as = []
    num.times do |i|
        as << output(:"a#{i}")
    end

    # Instantiate and connect the neurons.
    num.times do |i|
        bneuron(typ,lwidth,*weights_bias_set[i]).(:"bneuronI#{i}").(vecX,as[i])
    end

end


# System for testing the binarized mac.
Unit.system :bdenseTest do

    # The weights and biases
    # t_w_b = [
    #     [ _00000000000000000000000000000000, _000000 ],
    #     [ _00000000000000000000000000000001, _000001 ],
    #     [ _01010101010101010101010101010101, _001010 ],
    #     [ _11111111111111111111111111111110, _000101 ]
    # ]
    t_w_b = [
        [ _0000000000000000000000000000000000000000000000000000000000000000, _0000000 ],
        [ _0000000000000000000000000000000100000000000000000000000000000001, _0000010 ],
        [ _0101010101010101010101010101010101010101010101010101010101010101, _0010100 ],
        [ _1111111111111111111111111111111011111111111111111111111111111110, _0001010 ]
    ]

    # # 32-bit vectors for testing and their expected results.
    # t_valX_expA = [
    #     [ _00000000000000000000000000000000,[ _1, _1, _1, _0]],
    #     [ _00000000000000000000000000000001,[ _1, _1, _1, _0]],
    #     [ _01010101010101010101010101010101,[ _1, _1, _1, _1]],
    #     [ _10011100011000111000010000100001,[ _1, _1, _1, _1]],
    #     [ _00001111000011110111000111000111,[ _0, _1, _1, _1]],
    #     [ _11110000001111110111110000011111,[ _0, _0, _1, _1]]
    # ]
    # 64-bit vectors for testing and their expected results.
    t_valX_expA = [
        [ _0000000000000000000000000000000000000000000000000000000000000000,[ _1, _1, _1, _0]],
        [ _0000000000000000000000000000000100000000000000000000000000000001,[ _1, _1, _1, _0]],
        [ _0101010101010101010101010101010101010101010101010101010101010101,[ _1, _1, _1, _1]],
        [ _1001110001100011100001000010000110011100011000111000010000100001,[ _1, _1, _1, _1]],
        [ _0000111100001111011100011100011100001111000011110111000111000111,[ _0, _1, _1, _1]],
        [ _1111000000111111011111000001111111110000001111110111110000011111,[ _0, _0, _1, _1]]
    ]



    # The input and outputs of of the dense neuron layer.
    # [32].inner :vecX
    [64].inner :vecX
    as = []
    t_w_b.each_with_index do |(w,b),i|
        as << (inner :"a#{i}")
    end
    # The bdense instance to test.
    # bdense(bit[32],t_w_b).(:bdenseI).(vecX,*as)
    bdense(bit[64],t_w_b).(:bdenseI).(vecX,*as)

    # For displaying the input and expected output
    # [32].inner :vecX_v
    [64].inner :vecX_v
    [4].inner :expAs_v

    test do
        # Set each vector.
        t_valX_expA.each do |(valX, expAs)|
            send(:"vecX_v") <= valX
            send(:"expAs_v") <= expAs
            vecX <= valX
            !10.ns
        end
    end

end
