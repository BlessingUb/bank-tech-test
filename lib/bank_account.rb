require "date"

class BankAccount 
  attr_reader :balance

  def initialize 
    @balance = 0
  end 

  def deposit(amount)
    raise 'Invalid Input!, enter a number' if amount.is_a?(String)
    raise 'Invalid Input!, enter the right amount' if amount.negative? 

    @balance += amount
  end

  def withdraw(amount)
    raise 'Invalid Input!, enter a number' if amount.is_a?(String)
    raise 'Invalid Input!, enter the right amount' if amount.negative? 
    fail 'Insufficient funds!' if @balance < amount
    
    @balance -= amount
    
  end 

  # def statement 
  
  #   puts "date || credit || debit || balance\n"
  #   @transactions.map{ |each_transaction| puts "#{each_transaction[:date]} || #{each_transaction[:credit]} || #{each_transaction[:debit]} || #{each_transaction[:balance]}\n"}
    
  # end
  
end
