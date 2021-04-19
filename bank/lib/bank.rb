class AccountService
  def initialize(console, clock)
    @console = console
    @movements = []
    @clock = clock
  end

  def deposit(amount)
    current_balance =  @movements == [] ? 0 : @movements.last[:balance]
    balance = amount + current_balance
    movement = { amount: amount,  date: @clock.now, balance: balance }
    @movements << movement
  end

  def withdraw(amount)
    deposit(-amount)
  end

  def print_statement
    @console.print_line('DATE | AMOUNT | BALANCE')
    @movements.reverse.each do |movement|
      formated_date = movement[:date].strftime('%d/%m/%Y')
      @console.print_line("#{formated_date} | #{movement[:amount]} | #{movement[:balance]}")
    end
  end
end