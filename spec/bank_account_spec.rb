require 'bank_account' 

describe BankAccount do 
  it 'is initialized with an opening account balance of 0' do
    account = BankAccount.new
    expect(account.balance).to eq 0
  end

  describe '#deposit' do 
    it { is_expected.to respond_to(:deposit).with(1).argument }
  end

end