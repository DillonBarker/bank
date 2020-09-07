require 'account_memory'

describe AccountMemory do

    let(:account_memory) { AccountMemory.new() }
    let(:time_now) { Time.now.strftime("%d/%m/%Y") }

    it 'initializes with an empty hash attribute' do
        expect(account_memory.transaction).to eq ({})
    end

    it 'saves a transaction with date, type, amount and balance into a hash' do
        account_memory.save_credit_transaction(100, 100)
        expect(account_memory.transaction).to eq(date: time_now, type: 'credit', amount: Account::EXAMPLE_AMOUNT, balance: Account::EXAMPLE_AMOUNT)
    end

end