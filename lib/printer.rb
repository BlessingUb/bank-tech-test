require_relative 'statement'
class Printer 
  HEADER = "date || credit || debit || balance\n"

  def print(transactions) 
    puts HEADER
    this = transactions.reverse.map{ |each_transaction|
    "#{each_transaction[:date]} || #{format_transaction(each_transaction[:credit])}|| #{format_transaction(each_transaction[:debit])}|| #{format_number(each_transaction[:balance])}"}
    puts this.join("\n")
  end
  
  def format_transaction(transaction)
    transaction.nil? ? '' : "#{format_number(transaction)} "
  end

  def format_number(number)
    format('%.2f', number)
  end
end