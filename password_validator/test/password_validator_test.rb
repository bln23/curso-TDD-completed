require_relative '../lib/password_validator'
require "minitest/autorun"

class PasswordValidatorTest < Minitest::Test
  def test_should_contain_a_lowercase
    actual = PasswordValidator.is_valid('12a456789')

    assert_equal true, actual
  end

  def test_should_contain_a_capital_letter
    actual = PasswordValidator.is_valid('12A456789')

    assert_equal true, actual
  end

  def test_should_contain_a_number
    actual = PasswordValidator.is_valid('123456789')

    assert_equal true, actual
  end

  def test_should_contain_an_underscore
    actual = PasswordValidator.is_valid('12345678_9')

    assert_equal true, actual
  end

  def test_should_ensure_that_password_has_more_than_8_characters
    actual = PasswordValidator.is_valid('AaaA12345')

    assert_equal true, actual
  end
end
