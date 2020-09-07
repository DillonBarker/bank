require 'account'

describe Account do

    let(:account) { Account.new() }

    it 'can return the balance of that account ( 0 ), using a method' do
        expect(account.get_balance).to eq Account::STARTING_BALANCE
    end

    it 'can deposit money into account, this will change the balance' do
        expect{ account.deposit(100) }.to change{ account.balance }.by 100
        expect(account.balance).to eq 100
    end
end