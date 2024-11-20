defmodule AocDay01 do
  @moduledoc """
  https://adventofcode.com/2023/day/1
  """

  def calcLine(line) when is_binary(line) do
    digits = line |> String.to_charlist() |> Enum.filter(fn c -> c >= 48 && c <= 57 end)

    [digits |> hd, digits |> Enum.at(-1)]
    |> List.to_string()
    |> String.to_integer(10)
  end

  def calcResult do
    File.stream!("support/aoc_day01_full.txt")
    |> Enum.map(&calcLine/1)
    |> Enum.sum()
  end

  def calcLineP2(line) when is_binary(line) do
    [first_digit, last_digit] =
      ~r/(?=(\d|one|two|three|four|five|six|seven|eight|nine))/
      |> Regex.scan(line)
      |> firstAndLast()
      |> Enum.map(fn matchGroup -> matchGroup |> last |> substringToDigit end)

    first_digit * 10 + last_digit
  end

  def calcResultP2 do
    File.stream!("support/aoc_day01_full.txt")
    |> Enum.map(&String.trim_trailing/1)
    |> Enum.map(&calcLineP2/1)
    |> Enum.sum()
  end

  def substringToDigit(substring) do
    case substring do
      "one" -> 1
      "1" -> 1
      "two" -> 2
      "2" -> 2
      "three" -> 3
      "3" -> 3
      "four" -> 4
      "4" -> 4
      "five" -> 5
      "5" -> 5
      "six" -> 6
      "6" -> 6
      "seven" -> 7
      "7" -> 7
      "eight" -> 8
      "8" -> 8
      "nine" -> 9
      "9" -> 9
      _ -> :not_found
    end
  end

  @doc """
  returns a two-element list with the first and last elements of `arr`, possibly repeating them if `arr` has length 1.

  Raises `ArgumentError` if `arr` is empty.
  """
  def firstAndLast(arr) when is_list(arr) do
    [arr |> hd, arr |> last]
  end

  @doc """
  Returns the last element of a list. Raises `ArgumentError` if the list is empty.
  """
  def last(arr) when is_list(arr) do
    if length(arr) == 0 do
      raise ArgumentError
    end

    arr |> Enum.at(-1)
  end
end
