require "date"
require_relative 'statement'
require_relative 'printer'

class BankAccount 
  attr_reader :balance

  def initialize(statement = Statement.new ) 
    @balance = 0
    @statement = statement
  end 

  def deposit(amount)
    raise 'Invalid Input!, enter a number' if amount.is_a?(String)
    raise 'Invalid Input!, enter the right amount' if amount.negative? 

    @balance += amount
    @statement.credit_transaction(amount, @balance)
 
  end

  def withdraw(amount)
    raise 'Invalid Input!, enter a number' if amount.is_a?(String)
    raise 'Invalid Input!, enter the right amount' if amount.negative? 
    fail 'Insufficient funds!' if @balance < amount
    
    @balance -= amount
    @statement.debit_transaction(amount, @balance)
  
  end 

  def print_statement(from_printer = Printer.new) 
    from_printer.print(@statement.transactions)
  end
  
end
