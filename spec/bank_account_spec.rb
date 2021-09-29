require 'bank_account' 

describe BankAccount do 
  let(:statement) { double(:statement) }
  let(:account) { BankAccount.new(statement) } 

  before do 
    allow(statement).to receive(:debit_transaction)
    allow(statement).to receive(:credit_transaction)
  end
  
  it 'is initialized with an opening account balance of 0 and a new statement' do
    expect(account.balance).to eq 0 
  end

  describe '#deposit' do 
    it { is_expected.to respond_to(:deposit).with(1).argument }

    it 'should increase the balance by the amount given' do 
      expect { account.deposit 50 }.to change { account.balance }.by 50
      account.deposit(1500)
      account.deposit(2550)
      expect(account.balance).to eq 4100
    end

    it "raises an error when the amount entered is a negative value" do 
      expect { account.deposit(-1) }.to raise_error('Invalid Input!, enter the right amount')
    end

    it "raises an error when the amount entered is a string" do 
      expect { account.deposit("something") }.to raise_error('Invalid Input!, enter a number')
    end 

  end

  describe '#withdraw' do 
    it { is_expected.to respond_to(:withdraw).with(1).argument }

    it 'should reduce from the balance by the amount taken' do 
      account.deposit(500)
      expect { account.withdraw 1 }.to change { account.balance }.by(-1)
      account.withdraw(200)
      expect(account.balance).to eq 299
    end

    it 'throws an error message when amount to be withdrawn exceed balance' do 
      account.deposit(200)  
      expect { account.withdraw 250 }.to raise_error('Insufficient funds!')
    end

    it "raises an error when the amount entered is a negative value" do 
      expect { account.withdraw(-1) }.to raise_error('Invalid Input!, enter the right amount')
    end

    it "raises an error when the amount entered is a string" do 
      expect { account.withdraw("something") }.to raise_error('Invalid Input!, enter a number')
    end

  end

  # describe '#statement' do 
  #   it "includes the header for the statement" do 
  #     subject.deposit(200)        
  #     expect { account.statement }.to output("date || credit || debit || balance\n").to_stdout
  #   end
  # end

end 
