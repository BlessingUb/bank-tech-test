require 'printer'
describe Printer do
  
  describe '#prints' do
    it "returns the required header and format for the bank statement" do         
      expect { subject.print([{:date => "29/09/2021", :credit => 5000.00, :debit => nil, :balance => 5000.00}, {:date => "29/09/2021", :credit => 6000.00, :debit => nil, :balance => 11000.00} ])}.to output("date || credit || debit || balance\n29/09/2021 || 6000.00 || || 11000.00\n29/09/2021 || 5000.00 || || 5000.00\n").to_stdout
    end
  end
end
