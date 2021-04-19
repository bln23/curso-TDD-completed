require_relative '../lib/bank'
require "minitest/autorun"
require 'mocha/minitest'

class AccountServiceTest < Minitest::Test

  def test_should_print_statement_containing_all_transactions
    console = mock
    clock = mock
    clock.stubs(:now).returns(Time.new(2014, 04, 01), Time.new(2014, 04, 02), Time.new(2014, 04, 10))
    console.expects(:print_line).with("DATE | AMOUNT | BALANCE")
    console.expects(:print_line).with("10/04/2014 | 500 | 1400")
    console.expects(:print_line).with("02/04/2014 | -100 | 900")
    console.expects(:print_line).with("01/04/2014 | 1000 | 1000")
    account = AccountService.new(console, clock)
    account.deposit(1000)
    account.withdraw(100)
    account.deposit(500)

    account.print_statement
  end
end