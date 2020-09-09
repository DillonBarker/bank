require 'account'

describe Account do
    let(:account_memory_double) { instance_double(AccountMemory) }
    let(:account) { Account.new(account_memory_double) }
    let(:time_now) { Time.now.strftime('%d/%m/%Y') }
    let(:data) { {date: time_now, type: true, amount: Account::EXAMPLE_AMOUNT, balance: Account::EXAMPLE_AMOUNT} }

    it 'can return the balance of that account ( 0 ), using a method' do
        expect(account.balance).to eq Account::STARTING_BALANCE
    end

    it 'can deposit money into account, this will change the balance' do
        allow(account_memory_double).to receive(:save_credit_transaction)
        expect { account.deposit(Account::EXAMPLE_AMOUNT) }.to change { account.balance }.by Account::EXAMPLE_AMOUNT
        expect(account.balance).to eq Account::EXAMPLE_AMOUNT
    end

    it 'can withdraw money from an account, this will change the balance' do
       allow(account_memory_double).to receive(:save_credit_transaction)
       account.deposit(Account::EXAMPLE_AMOUNT)
       expect(account.balance).to eq(Account::EXAMPLE_AMOUNT)
       allow(account_memory_double).to receive(:save_debit_transaction)
       expect { account.withdraw(Account::EXAMPLE_AMOUNT) }.to change { account.balance }.by(-Account::EXAMPLE_AMOUNT)
       expect(account.balance).to eq Account::STARTING_BALANCE
    end

    it 'holds an instance of account memory' do
        expect(account.account_memory).to eq account_memory_double
    end
end
