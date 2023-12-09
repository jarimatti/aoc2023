defmodule Aoc2023.Day09 do
  def input() do
    File.read!("input/day09.txt")
  end

  def part1(data) do
    data
    |> parse_data()
    |> Enum.map(&next_number/1)
    |> Enum.sum()
  end

  defp parse_data(data) do
    data
    |> String.split("\n")
    |> Enum.reject(&Aoc2023.empty_string?/1)
    |> Enum.map(&String.split/1)
    |> Enum.map(fn l -> Enum.map(l, &String.to_integer/1) end)
  end

  defp next_number(history) do
    case done?(history) do
      true ->
        List.last(history)

      false ->
        next_number(delta(history)) + List.last(history)
    end
  end

  defp done?(history) do
    Enum.all?(history, fn x -> x == 0 end)
  end

  defp delta(history) do
    history
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.map(fn [a, b] -> b - a end)
  end
end
