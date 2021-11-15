defmodule SolutionBackTracking do
  @spec combination_sum(candidates :: [integer], target :: integer) :: [[integer]]
  def combination_sum(candidates, target) do
    items = Enum.sort(candidates)

    backtrack(items, target, items, [], [])
    |> Enum.reduce(MapSet.new(), fn x, acc -> MapSet.put(acc, Enum.sort(x)) end)
    |> Enum.to_list()
  end

  def backtrack(_items, remaining, _it, _current_comb, aggregator) when remaining < 0 do
    aggregator
  end

  def backtrack(_items, 0, _it, current_comb, aggregator) do
    aggregator ++ [current_comb]
  end

  def backtrack(_items, _remaining, [], _current_comb, aggregator) do
    aggregator
  end

  def backtrack(items, remaining, [curr | rest], current_comb, aggregator) do
    tmp = backtrack(items, remaining - curr, items, current_comb ++ [curr], aggregator)
    backtrack(items, remaining, rest, current_comb, tmp)
  end
end

IO.inspect(SolutionBackTracking.combination_sum([2, 3, 6, 7], 7))
IO.inspect(SolutionBackTracking.combination_sum([2, 3, 5], 8))
IO.inspect(SolutionBackTracking.combination_sum([2], 1))
IO.inspect(SolutionBackTracking.combination_sum([1], 1))
IO.inspect(SolutionBackTracking.combination_sum([1], 2))
IO.inspect(SolutionBackTracking.combination_sum([2, 7, 6, 3, 5, 1], 9))

defmodule SolutionBF do
  @spec combination_sum(candidates :: [integer], target :: integer) :: [[integer]]
  def combination_sum(candidates, target) do
    max_size = get_max_comb_size(Enum.min(candidates), target, 0)
    possible_combs = get_all_combinations_max_size(candidates, max_size, [], 1, [])

    possible_combs
    |> Enum.filter(fn l -> Enum.sum(l) == target end)
    |> Enum.reduce(MapSet.new(), fn x, acc -> MapSet.put(acc, Enum.sort(x)) end)
    |> Enum.to_list()
  end

  def get_all_combinations_max_size(items, max_size, _combinations, curr_size, _result)
      when curr_size == 1 do
    combinations = Enum.map(items, fn i -> [i] end)
    get_all_combinations_max_size(items, max_size, combinations, curr_size + 1, combinations)
  end

  def get_all_combinations_max_size(_items, max_size, _combinations, curr_size, result)
      when curr_size > max_size do
    result
  end

  def get_all_combinations_max_size(items, max_size, combinations, curr_size, result) do
    combs = for c <- combinations, i <- items, do: [i] ++ c
    get_all_combinations_max_size(items, max_size, combs, curr_size + 1, result ++ combs)
  end

  def get_max_comb_size(min_cand, target, times) when min_cand * times < target do
    get_max_comb_size(min_cand, target, times + 1)
  end

  def get_max_comb_size(_min_cand, _target, times) do
    times
  end
end

# IO.inspect(SolutionBF.combination_sum([2, 3, 6, 7], 7))
# IO.inspect(SolutionBF.combination_sum([2, 3, 5], 8))
# IO.inspect(SolutionBF.combination_sum([2], 1))
# IO.inspect(SolutionBF.combination_sum([1], 1))
# IO.inspect(SolutionBF.combination_sum([1], 2))
# IO.inspect(SolutionBF.combination_sum([2, 7, 6, 3, 5, 1], 9))
