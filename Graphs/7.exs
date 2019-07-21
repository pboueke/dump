defmodule Build do

    def make_deps([], dic), do: dic
    def make_deps([{dep, proj}|tail], dic) do
        case dic[proj] do
            nil -> make_deps(tail, Map.put(dic, proj, [dep]))        
            _ -> make_deps(tail, %{dic | proj => dic[proj] ++ [dep]})
        end
    end

    def get_depth(proj, deps, depth) do
        case deps[proj] do
            nil -> depth
            _ -> deps[proj] 
                |> Enum.map(fn x -> get_depth(x, deps, depth + 1) end)
                |> Enum.max
        end
    end

    def get_order(projs, deps) do
        projs 
        |> Enum.map(fn x -> {x, get_depth(x, deps, 0)} end)
        |> Enum.sort(fn ({x,x_depth},{y,y_depth}) -> x_depth < y_depth end)
        |> Enum.map(fn {proj, order} -> proj end)
    end
end

projects = [:a, :b, :c, :d, :e, :f]
dependencies = [{:a, :d}, {:f, :b}, {:b, :d}, {:f, :a}, {:d, :c}, {:a, :c}]

deps = Build.make_deps(dependencies, %{})
IO.inspect  deps
IO.puts Build.get_depth(:a, deps, 0)
IO.puts Build.get_depth(:c, deps, 0)
IO.inspect Build.get_order(projects, deps)