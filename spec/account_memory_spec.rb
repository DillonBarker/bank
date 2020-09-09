require 'account_memory'

describe AccountMemory do
    let(:account_memory) { AccountMemory.new }
    let(:credit_transaction) { double :transaction, date: "10/10/2020", type: true, amount: 100, balance: 100 }
    let(:debit_transaction) { double :transaction, date: "10/10/2020", type: true, amount: 100, balance: 100 }

    it 'initializes with an empty array attribute' do
        expect(account_memory.transactions).to eq([])
    end

    it 'saves a transaction with date, type, amount and balance into a hash' do
        
        account_memory.save_credit_transaction(credit_transaction)
        expect(account_memory.transactions).to eq([credit_transaction])
    end

    it 'saves a transaction with date, type, amount and balance into a hash' do
        
        account_memory.save_debit_transaction(debit_transaction)
        expect(account_memory.transactions).to eq([debit_transaction])
    end

    it 'can save multiple transactions to the transactions array' do
        account_memory.save_credit_transaction(credit_transaction) 
        account_memory.save_credit_transaction(credit_transaction)
        expect(account_memory.transactions).to eq([credit_transaction, credit_transaction])
    end
end
