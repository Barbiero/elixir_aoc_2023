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
    numeric_substrings = [
      "one",
      "1",
      "two",
      "2",
      "three",
      "3",
      "four",
      "4",
      "five",
      "5",
      "six",
      "6",
      "seven",
      "7",
      "eight",
      "8",
      "nine",
      "9"
    ]

    {first_digit_str, _} =
      numeric_substrings
      |> Enum.map(fn ss ->
        {ss, indexOf(ss, line, default: String.length(line))}
      end)
      |> Enum.min_by(fn {_, idx} -> idx end)

    {last_digit_str, _} =
      numeric_substrings
      |> Enum.map(fn ss -> {ss, indexOfLast(ss, line)} end)
      |> Enum.max_by(fn {_, idx} -> idx end)

    {first_digit, last_digit} =
      {substringToDigit(first_digit_str), substringToDigit(last_digit_str)}

    first_digit * 10 + last_digit
  end

  def calcResultP2 do
    File.stream!("support/aoc_day01_full.txt")
    |> Enum.map(&String.trim_trailing/1)
    |> Enum.map(&calcLineP2/1)
    |> Enum.sum()
  end

  def indexOf(needle, haystack, default \\ -1) do
    case String.split(haystack, needle, parts: 2) do
      [head, _] -> String.length(head)
      [_] -> default
    end
  end

  @doc """
  gets the index of the LAST occurrence of 'needle' in the 'haystack'.
  """
  def indexOfLast(needle, haystack, default \\ -1) do
    kcatsyah = haystack |> String.reverse()
    eldeen = needle |> String.reverse()

    idx_reverse =
      case String.split(kcatsyah, eldeen, parts: 2) do
        [head, _] -> String.length(head)
        [_] -> :not_found
      end

    case idx_reverse do
      :not_found -> default
      _ -> String.length(haystack) - idx_reverse - String.length(eldeen)
    end
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
end
