require 'bank_account' 

describe BankAccount do 

  let (:account) { BankAccount.new } 

  it 'is initialized with an opening account balance of 0' do
    expect(account.balance).to eq 0
  end

  describe '#deposit' do 
    it { is_expected.to respond_to(:deposit).with(1).argument }

    it 'should increase the balance by the amount given' do 
      expect{ account.deposit 50}.to change{account.balance }.by 50
      account.deposit(1500)
      account.deposit(2550)
      expect(account.balance).to eq 4100
    end
  end

end