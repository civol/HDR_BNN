# Class for describing a binarized neural network and a set of its inputs
# data.
# Can be used for generating either HW or SW BNN.

require 'json'

# Module containing tool for building BNN.
module BNNTools
    # Process a list of +raw+ floating values to a XNOR-compatible bit vector.
    def self.to_bnn_vector(raw)
        return raw.map {|val| val >= 0 ? "1" : "0" }.join.to_value
    end
end


# Class describing a BNN.
class BNNDescriptor

    # Creates a binarized neural network description from  json file named
    # +filename+.
    def initialize(filename)
        # Load the file.
        File.open(filename,"r+") do |f|
            # Load hash from JSON file.
            hash = JSON.load(f)
            # Get the weights
            @weights = hash["weights"]
            # Get the biases
            @biases = hash["biases"] 
        end

        # Binarize the weights.
        @weights.each do |layer|
            layer.map! do |weights|
                # puts "for weights=#{weights}"
                res = BNNTools.to_bnn_vector(weights)
                # puts "weights=#{res.content}"
                res
            end
        end

        # Quantize the biases.
        @biases.each_with_index do |layer,i|
            layer.map! do |bias|
                puts "For bias=#{bias}"
                # res = bias[0].to_i - @weights[i][0].width / 2
                res = bias[0].round - @weights[i][0].width / 2
                puts "bias=#{res}\n"
                res
            end
        end
    end

    # Gets the input width.
    def input_width
        @weights[0][0].width
    end

    # Gets the output width.
    def output_width
        @weights[-1].length
    end

    # Gets the depth (number of layers) of the network.
    def depth
        return @weights.size
    end

    # # Gets a copy of the weights per layer.
    # def weights
    #     return Marshal.load(Marshal.dump(@weights))
    # end

    # Gets a the weights per layer.
    def weights
        return @weights
    end

    # # Gets a copy of the biases per layer.
    # def biases
    #     return Marshal.load(Marshal.dump(@biases))
    # end

    # Gets the biases per layer.
    def biases
        return @biases
    end

    # Get a copy of the weights and biases by layer.
    def weights_biases
        # Combine weights and bias per layer.
        return @weights.zip(@biases).map do |(layer_w,layer_b)|
            layer_w.zip(layer_b)
        end
    end
end



# Describe a dataset (actual input and teach data) for binarized neural
# networks.
class BNNData
    attr_reader :input_data   # The input data as a bit string
    attr_reader :teach_data   # The expected output as a bit string

    # Create the  structure from +input_data+ and possible expected output
    # +teach_data+.
    def initialize(input_data,teach_data)
        @input_data = BNNTools.to_bnn_vector(input_data)
        @teach_data = BNNTools.to_bnn_vector(teach_data)
        puts "@input_data=#{@input_data.content}"
        # puts "@teach_data=#{@teach_data.content}"
    end
end

# Describes a list of inputs (actual input and expected outputs) for
# binarized neural networks.
class BNNDataList

    # Creates a set of inputs (data and expected output) for binarized neural 
    # networks from json file named
    # +filename+.
    def initialize(filename)
        # Load the file.
        File.open(filename,"r+") do |f|
            # Load hash from JSON file.
            @entries = JSON.load(f).map do |entry| 
                BNNData.new(entry["input_data"],entry["teach_data"])
            end
        end
    end

    # Get the number of data.
    def size
        return @entries.size
    end

    # Iterates on the input entries.
    def each(&ruby_block)
        # No ruby block? Return an enumerator.
        return to_enum(:each) unless ruby_block
        # A ruby block? Apply it on each input signal instance.
        @entries.each(&ruby_block)
    end

    # Get an entry by index.
    def get(idx)
        return @entries[idx]
    end
    alias_method :[], :get

    # Iterates on the input data.
    def each_input_data(&ruby_block)
        # No ruby block? Return an enumerator.
        return to_enum(:each_input_data) unless ruby_block
        # A ruby block? Apply it on each input signal instance.
        @entries.each {|entry| ruby_block.call(entry.input_data) }
    end

    # Get an input data by index.
    def get_input_data(idx)
        entry = @entries[idx]
        if entry then
            return entry.input_data
        else
            return nil
        end
    end

    # Iterates on the teach data.
    def each_teach_data(&ruby_block)
        # No ruby block? Return an enumerator.
        return to_enum(:each_teach_data) unless ruby_block
        # A ruby block? Apply it on each input signal instance.
        @entries.each {|entry| ruby_block.call(entry.teach_data) }
    end

    # Get a teach data by index.
    def get_teach_data(idx)
        entry = @entries[idx]
        if entry then
            return entry.teach_data
        else
            return nil
        end
    end
end
