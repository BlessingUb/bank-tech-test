require 'bank_account' 

describe BankAccount do 

  let(:account) { BankAccount.new } 

  it 'is initialized with an opening account balance of 0' do
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
  end

  describe '#withdraw' do 
    it { is_expected.to respond_to(:withdraw).with(1).argument }

    it 'should reduce from the balance by the amount taken' do 
      expect { account.withdraw 1 }.to change { account.balance }.by(-1)
      account.deposit(500)
      account.withdraw(200)
      expect(account.balance).to eq 299
    end

    it 'throws an error message when amount to be withdrawn exceed balance' do 
      account.deposit(200)  
      expect { subject.withdraw 300 }.to raise_error 'Insufficient funds!, you need to increase your earnings!'
    end
  end

end 
