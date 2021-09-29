require 'printer'
describe Printer do
  
  describe '#print' do
    it "returns the required header and format for the bank statement" do         
      expect { subject.print([{:date=>"29/09/2021", :credit=>5000, :debit=>0, :balance=>5000}, {:date=>"29/09/2021", :credit=>6000, :debit=>0, :balance=>11000} ])}.to output("date || credit || debit || balance\n29/09/2021 || 6000 || 0 || 11000\n29/09/2021 || 5000 || 0 || 5000\n").to_stdout
    end
  end
end