alias :math, as: Math

# 1.
# { x, y }
point_a = { 1, 1 }
point_b = { 2, 2 }
point_c = { 2, 1 }
point_d = { 1, 2 }
# { A, B }
line = { point_a, point_b }
# { P, R }
circle = { point_a, 1}
# { A, B, C }
triangle = { point_a, point_b, point_c }
# { A ... Z }
polygon = { point_a, point_b, point_c, point_d }

# 2.
hypotenuse = &(Math.sqrt(Math.pow(&1,2) + Math.pow(&2,2)))
IO.puts hypotenuse.(3,4)

# 3. & 4.
IO.puts is_atom(String.to_atom("atom"))

# 4.
numbers = [6,7,8,9,10,1,2,3,4,5]

defmodule Ex4 do
    def my_size([]), do: 0
    def my_size([_|tail]), do: 1 + my_size(tail)

    def my_max([head|tail]), do: my_max(tail, head)
    defp my_max([],max), do: max
    defp my_max([head|tail], max) when max > head do
        my_max(tail, max)
    end
    defp my_max([head|tail], max) when max <= head do
        my_max(tail, head)
    end 

    def my_min([head|tail]), do: my_min(tail, head)
    defp my_min([],min), do: min
    defp my_min([head|tail], min) when min <= head do
        my_min(tail, min)
    end
    defp my_min([head|tail], min) when min > head do
        my_min(tail, head)
    end 
end

IO.puts Ex4.my_size(numbers)
IO.puts Ex4.my_max(numbers)
IO.puts Ex4.my_min(numbers)

# 5. 
atoms = [:one, :two, :two, :three, :three, :three]

defmodule Ex5 do
    def word_count(atoms), do: word_count(atoms,%{})
    defp word_count([],count), do: count
    defp word_count([head|tail],count) do
        word_count(tail, Map.put(count, head, (count[head] || 0) + 1))
    end
end

IO.inspect Ex5.word_count(atoms)

# 6.
tree = {"1", {"1 2", "1 3", {"1 2 3"}}, {"1 4"}, "1"}

defmodule Ex6 do
    def traverse(tree), do: traverse(tree, 1)
    def traverse([],_) do end
    def traverse(tree, level) when is_tuple(tree) do
        traverse(Tuple.to_list(tree), level)
    end
    def traverse([head|tail], level) when is_binary(head) do
        IO.puts String.duplicate(" ", level) <> head
        traverse(tail, level)
    end
    def traverse([head|tail], level) when is_tuple(head) do
        traverse([Tuple.to_list(head)|tail], level)
    end
    def traverse([head|tail], level) when is_list(head) do
        traverse(head, level + 1)
        traverse(tail, level)
    end 
end

Ex6.traverse(tree)