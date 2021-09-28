require "date"

class BankAccount 
  THISDAY = Date.today.strftime("%d/%m/%Y")
  attr_reader :balance, :transactions

  def initialize 
    @balance = 0
    @transactions = []
  end 

  def deposit(amount)
    raise 'Invalid Input!, enter a number' if amount.is_a?(String)
    raise 'Invalid Input!, enter the right amount' if amount.negative? 

    @balance += amount
    @transactions << { date: THISDAY, credit: amount, debit: 0, balance: @balance }
  end

  def withdraw(amount)
    raise 'Invalid Input!, enter a number' if amount.is_a?(String)
    raise 'Invalid Input!, enter the right amount' if amount.negative? 
    fail 'Insufficient funds!' if @balance < amount
    
    @balance -= amount
    @transactions << { date: THISDAY, credit: 0, debit: amount, balance: @balance }
    
  end

end
