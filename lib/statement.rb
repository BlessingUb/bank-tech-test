require 'date'
class Statement 
  THISDAY = Date.today.strftime("%d/%m/%Y")
  attr_reader :transactions

  def initialize 
    @transactions = []
  end 

  def credit_transaction(amount, balance)
    @transactions << { date: THISDAY, credit: amount, debit: nil, balance: balance }
  end

  def debit_transaction(amount, balance)
    @transactions << { date: THISDAY, credit: nil, debit: amount, balance: balance }
  end
end
