require 'statement'
describe Statement do  

  it 'initialized with no transactions' do
    expect(subject.transactions).to be_empty
  end

  context '#credit_transaction' do 
    it 'includes the date, credit, debit and balance in a credit transaction' do
      subject.credit_transaction(200, 200)
      expect(subject.transactions[0][:date]).to eq Statement::THISDAY
      expect(subject.transactions[0][:credit]).to eq 200
      expect(subject.transactions[0][:debit]).to eq ()
      expect(subject.transactions[0][:balance]).to eq 200
    end 
  end

  context '#debit_transaction' do 
    it 'includes the date, credit, debit and balance in a transaction' do
      subject.credit_transaction(200, 200)
      subject.debit_transaction(50, 150)
      expect(subject.transactions[1][:date]).to eq Statement::THISDAY
      expect(subject.transactions[1][:credit]).to eq ()
      expect(subject.transactions[1][:debit]).to eq 50
      expect(subject.transactions[1][:balance]).to eq 150
    end
  end
end
