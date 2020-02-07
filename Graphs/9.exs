defmodule Vertex do

    defstruct left: nil, right: nil, parent: nil

end

# brute force solution, generating all possible combinations and checking which ones are valid

defmodule BSTSequence do

    def permutations([]), do: [[]]
    def permutations(list), do: for elem <- list, rest <- permutations(list--[elem]), do: [elem|rest]
    def generate_all_possible_sequences(tree), do: permutations(Map.keys(tree))

    def is_valid_reversed_sequence(_tree, [_v]), do: true
    def is_valid_reversed_sequence(tree, [v|rest_of_sequence]) do

        if Enum.member?(rest_of_sequence, tree[v].parent) do
            false
        else
            is_valid_reversed_sequence(tree, rest_of_sequence)
        end

    end

    def select_valid_sequences(tree, sequences) do
        
        Enum.filter(sequences, fn(x) -> is_valid_reversed_sequence(tree, Enum.reverse(x)) end)

    end

    def possible_originating_arrays(tree) do

        select_valid_sequences(tree, generate_all_possible_sequences(tree))
        |> Enum.map(fn(x) -> Enum.reverse(x) end)

    end

end

defmodule Main do

    def main do

        example_tree = %{
            1 => %Vertex{parent: 2},               #        2
            2 => %Vertex{left: 1, right: 3},       #      /   \
            3 => %Vertex{parent: 2}                #     1     3
        }                                          # {2,1,3}, {2,3,1}

        IO.inspect BSTSequence.possible_originating_arrays(example_tree)
        IO.puts "----------------------"

        tree = %{
            50 => %Vertex{left: 25, right: 75},                 #                   50
            25 => %Vertex{left: 12, parent: 50},                #                 /    \
            75 => %Vertex{left: 60, right: 80, parent: 50},     #                25    75
            12 => %Vertex{left: 5, right: 15, parent: 25},      #               /     /   \
            60 => %Vertex{parent: 75},                          #              12    60    80
            80 => %Vertex{parent: 75},                          #             /  \
            5 =>  %Vertex{parent: 12},                          #            5    15
            15 => %Vertex{parent: 12},                          #        {50,25,75,12,60,80,5,15}, ...
        }

        possible_origins = BSTSequence.possible_originating_arrays(tree)
        IO.inspect possible_origins

    end

end

Main.main