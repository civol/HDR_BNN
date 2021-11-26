# Generator of pipelined binarized neural network for a json file
# describing the network and its weights and biases.

require 'std/hruby_unit.rb'

require_relative "bnn_descriptor.rb"
require_relative "bnn_pipe_gen.rb"



# Loads the bnn description and input dataset.
$description = BNNDescriptor.new("network_bnn.json")
$data_list  = BNNDataList.new("check_bnn.json")


# System for building an integrated BNN with testing memory.
system :bnn_pipe_chip do |lwidth = 4|
    lwidth = 1
    # Get the dimensions of the BNN.
    iwidth = $description.input_width   # Input width
    owidth = $description.output_width  # Output width
    depth  = $description.depth         # Depth (number of layers)
    # The input and output types.
    ityp = bit[iwidth]
    otyp = bit[owidth]
    # The number of data.
    ndata = $data_list.size
    puts "ndata=#{ndata}"

    # Clock and reset only for the input.
    input :clk, :rst

    # Result and expected result for the output.
    otyp.output :vecY, :vecT

    # The register containing the input of the BNN.
    ityp.inner :vecX

    # puts "$data_list.each_input_data.to_a=#{$data_list.each_input_data.to_a}"

    # The memory containing the input vectors.
    ityp[-ndata].constant vecXs: $data_list.each_input_data.to_a
    # The memory containing the expected ouputs padded with 0 to match
    # the delay of the BNN
    otyp[-(ndata+depth)].constant vecTs: [_0.as(otyp)] * depth +
        $data_list.each_teach_data.to_a

    # The counter for accessing the data.
    [(ndata+depth).width+1].inner :data_count

    # Generate and instantiate the BNN.
    bnn_pipe_gen(lwidth, $description).(:my_bnn).(clk,rst,vecX,vecY)

    # The process feeding the input to the BNN and provide the expected
    # outputs at the right tempo.
    par(clk.posedge) do
        hif(rst) do
            data_count <= 0
            vecX <= 0
            vecT <= 0
        end
        helse do
            # Set the input of the bnn.
            # hif(data_count - ndata < 0) { vecX <= vecXs[data_count] }
            hif(data_count < ndata) { vecX <= vecXs[data_count] }
            # Set the expected output.
            # vecT <= vecTs[data_count]
            # Prepare the next iteration.
            # hif((data_count - (ndata + depth)) < 0) do
            hif(data_count < (ndata + depth)) do
                data_count <= data_count + 1
                # Set the expected output.
                vecT <= vecTs[data_count]
            end
            helse { data_count <= 0 }
        end
    end
end


# System for testing the pipelined binarized neuron network generator.
Unit.system :bnn_pipe_chipTest do

    # The signals for operating the BNN.
    inner :clk,:rst # Clock and reset
    # Declare the output vector and expected result.
    bit[$description.output_width].inner :vecY, :vecT

    # Instantiate the BNN chip
    bnn_pipe_chip(:my_bnn).(clk,rst,vecY,vecT)

    # Performs the test.
    test do
        # Initialize the circuit.
        clk <= 0
        rst <= 0
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
        ($data_list.size+$description.depth+5).times do
            clk <= 1
            !10.ns
            clk <= 0
            !10.ns
        end
    end
end


