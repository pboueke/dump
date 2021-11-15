defmodule Vertex do

    defstruct left: nil, right: nil, parent: nil

end

defmodule BinaryTree do

    #generates an unique random number different from any in the already_used MapSet
    def generate_unique_number(max, already_used) do
        
        number = Enum.random(0..(max*1000))
        
        if MapSet.member?(already_used, number) do
            generate_unique_number(max, already_used)
        else
            [number, MapSet.put(already_used, number)]
        end

    end
    
    # generates a array of unique random numbers
    def generate_random_array(size), do: generate_random_array(size, size, [], %MapSet{})
    def generate_random_array(_size, 0, seq, _already_used), do: seq
    def generate_random_array(size, counter, seq, already_used) do

        [number, new_already_used] = generate_unique_number(size, already_used)
        generate_random_array(size, counter - 1, seq ++ [number], new_already_used)

    end

    # finds the root of the tree
    def root(tree) do
        
        if Enum.count(Map.keys(tree)) == 0 do
            -1
        else
            root_list = 
                for key <- Map.keys(tree), do: [{key, tree[key].parent}]
                |> Enum.find(fn({_k, p}) -> p == nil end)

            {root, nil} = List.keyfind(root_list, nil, 1)
            root
        end

    end

    # inserts a new number v in the tree
    def insert(tree, v), do: insert(tree, root(tree), v)
    def insert(tree, root, v) do
        
        if Enum.count(Map.keys(tree)) == 0 do
            Map.put(tree, v , %Vertex{})
        else
            if v < root do
                if tree[root].left == nil do
                    Map.replace!(tree, root, %Vertex{left: v, right: tree[root].right, parent: tree[root].parent})
                    |> Map.put(v, %Vertex{parent: root})
                else 
                    insert(tree, tree[root].left, v)
                end
            else
                if tree[root].right == nil do
                    Map.replace!(tree, root, %Vertex{left: tree[root].left, right: v, parent: tree[root].parent})
                    |> Map.put(v, %Vertex{parent: root})
                else
                    insert(tree, tree[root].right, v)
                end
            end
        end

    end

    # generates a tree from an array of unique numbers 
    def generate_from_array(array), do: generate_from_array(array, %{})
    def generate_from_array([], tree), do: tree
    def generate_from_array([h|t], tree) do

        generate_from_array(t, insert(tree, h))

    end

    # adds vertices from tree to the subtree starting from the given vertex
    def create_subtree(subtree, _tree, nil), do: subtree
    def create_subtree(subtree, tree, vertex) do

        parent = if Enum.count(Map.keys(subtree)) == 0, do: nil, else: tree[vertex].parent

        subtree 
        |> Map.put(vertex, %Vertex{right: tree[vertex].right, left: tree[vertex].left, parent: parent})
        |> create_subtree(tree, tree[vertex].left)
        |> create_subtree(tree, tree[vertex].right)

    end

    # instantiates a new random subtree of tree
    def select_random_subtree(tree) do
        
        root = Enum.random(Map.keys(tree))
        create_subtree(%{}, tree, root)

    end

    # answers if the vertex an all its children are the same in the tree and in the subtree
    def is_subtree?(tree, subtree), do: is_subtree?(tree, subtree, root(subtree))
    def is_subtree?(_tree, _subtree, nil), do: true
    def is_subtree?(tree, subtree, vertex) do

        if tree[vertex] == nil do
            false
        else
            if tree[vertex].left == subtree[vertex].left and tree[vertex].right == subtree[vertex].right do
                is_subtree?(tree, subtree, subtree[vertex].left) and is_subtree?(tree, subtree, subtree[vertex].right)
            else
                false
            end
        end
        
    end

end

defmodule Main do

    def main do

        array = BinaryTree.generate_random_array(1000)
        IO.inspect array
        tree = BinaryTree.generate_from_array(array)
        IO.inspect tree
        subtree = BinaryTree.select_random_subtree(tree)
        IO.inspect subtree
        IO.puts "Is subtree: #{BinaryTree.is_subtree?(tree, subtree)}"
        array2 = BinaryTree.generate_random_array(10)
        not_subtree = BinaryTree.generate_from_array(array2)
        IO.inspect not_subtree
        IO.puts "Is subtree: #{BinaryTree.is_subtree?(tree, not_subtree)}"

    end

end

Main.main