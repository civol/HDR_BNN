# Generator of pipelined binarized neural network for a json file
# describing the network and its weights and biases.


require_relative "bnn_descriptor.rb"
require_relative "bnn_pipe.rb"


# Generate a pipelined binarized neural network processing system
# from BNN description +description+.
def bnn_pipe_gen(lwidth = 4,description)
    # Generate the input type.
    typ = bit[description.input_width]

    # Generate the binarized neural network.
    return bnn_pipe(typ,lwidth,description.weights_biases)
end



# System for testing the pipelined binarized neuron network generator.
Unit.system :bnn_pipe_genTest do
    # Loads the bnn description and input dataset.
    $description = BNNDescriptor.new("network_bnn.json")
    $data_list  = BNNDataList.new("check_bnn.json")

    # Get the dimensions of the BNN.
    iwidth = $description.input_width   # Input width
    owidth = $description.output_width  # Output width
    depth  = $description.depth         # Depth (number of layers)
    # The input and output types.
    ityp = bit[iwidth]
    otyp = bit[owidth]

    # The signals for operating the BNN.
    inner :clk,:rst # Clock and reset
    # Declare the input vector.
    ityp.inner :vecX
    # Declare the output vector and expected result.
    otyp.inner :vecY, :vecT

    # Generate and instantiate the BNN.
    bnn_pipe_gen($description).(:my_bnn).(clk,rst,vecX,vecY)

    # Performs the test.
    test do
        # Initialize the circuit.
        clk <= 0
        rst <= 0
        vecX <= 0
        vecT <= 0
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
        clk <= 0
        !10.ns
        # Perform the test.
        $data_list.each_input_data.each_with_index do |input_data,i|
            clk <= 1
            vecX <= input_data
            teach_data = $data_list.get_teach_data(i-depth)
            vecT <= teach_data if teach_data
            !10.ns
            clk <= 0
            !10.ns
        end
        depth.times do
            clk <= 1
            !10.ns
            clk <= 0
            !10.ns
        end
    end
end
