require_relative 'statement'
class Printer 
  HEADER = "date || credit || debit || balance\n"

  def print(transactions) 
    puts HEADER
    this = transactions.reverse.map{ |each_transaction|
    "#{each_transaction[:date]} || #{each_transaction[:credit]} || #{each_transaction[:debit]} || #{each_transaction[:balance]}"}
    puts this.join("\n")
  end
end