defmodule Ex6 do
    def compress(string) do
        compressed = string
        |> String.graphemes
        |> get_compressed_list([])
        |> Enum.join

        if byte_size(compressed) > byte_size(string) do
            string
        else 
            compressed
        end
    end

    def get_compressed_list([], new), do: new

    def get_compressed_list([h|t], []) do
        get_compressed_list(t, [h, 1])
    end

    def get_compressed_list([h|t], new) do
        if h == Enum.at(new, -2) do
            new_new = Enum.slice(new,0,length(new) - 1) ++ [Enum.at(new, -1) + 1]
            get_compressed_list(t,new_new)
        else
            new_new = new ++ [h, 1] 
            get_compressed_list(t,new_new)
        end
    end

end

IO.puts Ex6.compress "AAAAbbbccccdeefffffff"
IO.puts Ex6.compress "abcdefghijklmnopqrstu"