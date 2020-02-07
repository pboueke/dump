defmodule Vertix do

    defstruct children: [], parent: nil

end

defmodule CommonAncestor do

    # gets the depth of a vertix in the tree
    def get_depth(tree, v) do
        case tree[v].parent do
            nil -> 1
            _ -> get_depth(tree, tree[v].parent) + 1
        end
    end

    # climbs the tree from the vertex to the node of the targeted depth
    def climb_to_depth(tree, target, v) do
        case get_depth(tree, v) do
            target -> v
            _ -> climb_to_depth(tree, target, tree[v].parent)
        end
    end

    # finds the common ancestor of two nodes of same depth
    def find_ca(tree, v1, v2) do
        v2_parent = tree[v2].parent
        case tree[v1].parent do
            v2_parent -> tree[v1].parent
            _ -> find_ca(tree, tree[v1].parent, tree[v2].parent)
        end
    end
    
    # gets the common ancestor of two nodes in a tree
    def get_ca(tree, v1, v2) do

        v1_depth = get_depth(tree, v1)
        v2_depth = get_depth(tree, v2)

        low = if v1_depth > v2_depth, do: v1, else: v2
        high = if v1_depth < v2_depth, do: v1, else: v2
        target = if v1_depth < v2_depth, do: v1_depth, else: v2_depth

        equalized = climb_to_depth(tree, target, low)

        find_ca(tree, high, equalized)

    end

end

defmodule Main do

    def main do
        tree = %{
            :a => %Vertix{children: [:b, :c, :d]},
            :b => %Vertix{children: [:e, :f], parent: :a},
            :c => %Vertix{parent: :a},
            :d => %Vertix{parent: :a},
            :e => %Vertix{children: [:g], parent: :b},
            :f => %Vertix{parent: :b},
            :g => %Vertix{parent: :e}
        }

        IO.puts CommonAncestor.get_ca(tree, :b, :e)
        IO.puts CommonAncestor.get_ca(tree, :e, :g)
    end

end

Main.main

