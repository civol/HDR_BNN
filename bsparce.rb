require_relative "bneuron.rb"

##
#  Generic module for computing a sparce layer of binarized neurons
########################################################################



# System implementing a sparce layer of binarized neuron for
# generic set of input bit vector +vecXs+ and outputs the result to set
# binarized values +as+.
#
# NOTE: binarized values are 0 for -1 and 1 for +1
#
# Generic arguments:
# - +typ+ is the type of the input vector or the number
#   of bits of the vectors.
# - +lwidth+ the input width of the LUT of the LUT layers of the popcount.
# - +weight_bias_set+ the set of weights and bias values
system :bsparce do |typ, lwidth = 4, weights_bias_set|
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

    # Declare the input and output.
    vecXs = []
    as = []
    num.times do |i|
        vecXs << typ.input(:"vecX#{i}")
    end
    num.times do |i|
        as << output(:"a#{i}")
    end

    # Instantiate and connect the neurons.
    num.times do |i|
        bneuron(typ,*weights_bias_set[i]).(:"bneuronI#{i}").(vecXs[i],as[i])
    end

end


# System for testing the binarized mac.
Unit.system :bsparceTest do

    # The weights and biases
    t_w_b = [
        [ _00000000000000000000000000000000, _000000 ],
        [ _00000000000000000000000000000001, _000001 ],
        [ _01010101010101010101010101010101, _001010 ],
        [ _11111111111111111111111111111110, _000101 ]
    ]

    # 32-bit vectors for testing and their expected results.
    t_valX_expA = [
        [ _00000000000000000000000000000000,[ _1, _1, _1, _0]],
        [ _00000000000000000000000000000001,[ _1, _1, _1, _0]],
        [ _01010101010101010101010101010101,[ _1, _1, _1, _1]],
        [ _10011100011000111000010000100001,[ _1, _1, _1, _1]],
        [ _00001111000011110111000111000111,[ _0, _1, _1, _1]],
        [ _11110000001111110111110000011111,[ _0, _0, _1, _1]]
    ]



    # The input and outputs of of the sparce neuron layer.
    vecXs = []
    as = []
    t_w_b.each_with_index do |(w,b),i|
        vecXs << ([32].inner :"vecX#{i}")
        as << (inner :"a#{i}")
    end
    # The bsparce instance to test.
    bsparce(bit[32],t_w_b).(:bsparceI).(*vecXs,*as)

    # For displaying the input and expected output
    [32].inner :vecX_v
    [4].inner :expAs_v

    test do
        # Set each vector.
        t_valX_expA.each do |(valX, expAs)|
            send(:"vecX_v") <= valX
            send(:"expAs_v") <= expAs
            vecXs.each { |vecX| vecX <= valX }
            !10.ns
        end
    end

end
