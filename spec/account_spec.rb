require 'account'

describe Account do
    let(:account_memory_double) { instance_double(AccountMemory)}
    let(:account) { Account.new(account_memory_double) }
    let(:time_now) { Time.now.strftime("%d/%m/%Y") }

    it 'can return the balance of that account ( 0 ), using a method' do
        expect(account.get_balance).to eq Account::STARTING_BALANCE
    end

    it 'can deposit money into account, this will change the balance' do
        allow(account).to receive(:save_credit_transaction)
        expect{ account.deposit(Account::EXAMPLE_AMOUNT) }.to change{ account.balance }.by Account::EXAMPLE_AMOUNT
        expect(account.get_balance).to eq Account::EXAMPLE_AMOUNT
    end

    it 'can withdraw money from an account, this will change the balance' do
       allow(account).to receive(:save_credit_transaction)
       account.deposit(Account::EXAMPLE_AMOUNT)
       expect(account.get_balance).to eq(Account::EXAMPLE_AMOUNT)
       allow(account).to receive(:save_debit_transaction)
       expect{ account.withdraw(Account::EXAMPLE_AMOUNT) }.to change{ account.get_balance }.by -Account::EXAMPLE_AMOUNT
       expect(account.get_balance).to eq Account::STARTING_BALANCE
    end

    it 'holds an instance of account memory' do
        expect(account.account_memory).to eq (account_memory_double)
    end

    it 'can store a the date when a transaction is made.' do
        allow(account_memory_double).to receive(:transactions).and_return({})
        account.deposit(Account::EXAMPLE_AMOUNT)
        expect(account.account_memory.transactions).to eq(date: time_now)
    end
end