require 'account'

describe Account do

    let(:account) { Account.new() }

    it 'can return the balance of that account ( 0 ), using a method' do
        expect(account.get_balance).to eq Account::STARTING_BALANCE
    end

    it 'can deposit money into account, this will change the balance' do
        expect{ account.deposit(Account::EXAMPLE_AMOUNT) }.to change{ account.balance }.by Account::EXAMPLE_AMOUNT
        expect(account.get_balance).to eq Account::EXAMPLE_AMOUNT
    end

    it 'can withdraw money from an account, this will change the balance' do
       account.deposit(Account::EXAMPLE_AMOUNT)
       expect(account.get_balance).to eq(Account::EXAMPLE_AMOUNT)
       expect{ account.withdraw(Account::EXAMPLE_AMOUNT) }.to change{ account.get_balance }.by -Account::EXAMPLE_AMOUNT
       expect(account.get_balance).to eq Account::STARTING_BALANCE
    end
end