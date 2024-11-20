defmodule AocDay01Test do
  use ExUnit.Case
  doctest AocDay01

  test "string converts to two-digit" do
    assert AocDay01.calcLine("1abc2") == 12
    assert AocDay01.calcLine("pqr3stu8vwx") == 38
    assert AocDay01.calcLine("a1b2c3d4e5f") == 15
    assert AocDay01.calcLine("treb7uchet") == 77
  end

  test "read file and calc the known result" do
    assert AocDay01.calcResult() == 53194
  end

  test "get indexOf substring" do
    assert AocDay01.indexOf("one", "12onethreefourone") == 2
  end

  test "get indexOfLast substring" do
    assert AocDay01.indexOfLast("one", "12onethreefourone") ==
             String.length("12onethreefourone") - String.length("one")

    assert String.slice(
             "12onethreefourone",
             AocDay01.indexOfLast("one", "12onethreefourone")..String.length("12onethreefourone")
           ) ==
             "one"
  end

  test "finds first and last digits" do
    assert AocDay01.calcLineP2("two1nine") == 29
    assert AocDay01.calcLineP2("eightwothree") == 83
    assert AocDay01.calcLineP2("abcone2threexyz") == 13
    assert AocDay01.calcLineP2("xtwone3four") == 24
    assert AocDay01.calcLineP2("4nineeightseven2") == 42
    assert AocDay01.calcLineP2("zoneight234") == 14
    assert AocDay01.calcLineP2("7pqrstsixteen") == 76
  end

  test "read file and calc the known result part 2" do
    assert AocDay01.calcResultP2() == 54249
  end
end
