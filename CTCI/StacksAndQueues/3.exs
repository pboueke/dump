defmodule Stack do
    @stack_size 2

    def push([], value) do
        List.insert_at([],0,[value])
    end
    def push([head|tail], value) do
        if Enum.count(head) < @stack_size do
            [(head ++ [value]) | tail]
        else
            [head | push(tail, value)]
        end
    end

    def pop([]), do: raise "Stack Empty!"
    def pop(stack) do
        kcats = Enum.reverse(stack)
        [last| rest] = kcats
        {popped, tail} = List.pop_at(last, -1)
        if Enum.count(tail) > 0 do
            { popped, Enum.reverse(rest) ++ [tail] }
        else
            { popped, Enum.reverse(rest) }
        end
    end

    def pop_at(stack, index) do
        {popped, rest} = pop_at_helper(stack, index, 0)
        if Enum.count(rest) > 0 do
            tmp = List.delete_at(stack, index)
            result = List.insert_at(tmp, index, rest)
            {popped, result}
        else
            {popped, List.delete_at(stack, index)} 
        end
    end

    defp pop_at_helper([], index, current), do: raise "Nothing on provided index!"
    defp pop_at_helper([head|tail], index, current) when index == current do
        List.pop_at(head, -1)
    end
    defp pop_at_helper([head|tail], index, current) do
        pop_at_helper(tail,index,current+1)
    end
end

stack = []
filled = stack |> Stack.push(1) |> Stack.push(1)|> Stack.push(1)|> Stack.push(1)|> Stack.push(1)
IO.inspect filled
IO.puts ""
{ popped, popped_stack } = Stack.pop(filled)
IO.inspect Stack.pop(popped_stack)
IO.puts ""
{ popped2, popped_at_stack} = Stack.pop_at(filled, 1)
IO.inspect popped_at_stack
IO.inspect Stack.pop_at(popped_at_stack, 1)