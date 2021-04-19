require_relative '../lib/fizz_buzz'
require "minitest/autorun"

class FizzBuzzTest < Minitest::Test
  def test_should_return_final_number_in_the_list_of_numbers
    actual = FizzBuzz.print_fizz

    assert_equal 100, actual.length
  end

  def test_return_fizz_when_multiple_of_trhee
    actual = FizzBuzz.print_fizz

    assert_equal 'Fizz', actual[2]
    assert_equal 'Fizz', actual[8]
  end

  def test_return_buzz_when_multiple_of_five
    actual = FizzBuzz.print_fizz

    assert_equal 'Buzz', actual[4]
    assert_equal 'Buzz', actual[19]
  end

  def test_return_fizzbuzz_when_multiple_of_trhee_and_five
    actual = FizzBuzz.print_fizz

    assert_equal 'FizzBuzz', actual[14]
    assert_equal 'FizzBuzz', actual[29]
  end
end
