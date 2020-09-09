require 'account_memory'

describe AccountMemory do
    let(:account_memory) { AccountMemory.new }
    let(:time_now) { Time.now.strftime('%d/%m/%Y') }

    def stub_date(chosen_date)
        now = Time.parse(chosen_date)
        allow(Time).to receive(:now) { now }
    end

    it 'initializes with an empty hash attribute' do
        expect(account_memory.transaction).to eq({})
    end

    it 'saves a transaction with date, type, amount and balance into a hash' do
        stub_date("09/09/2020")
        account_memory.save_credit_transaction(100, 100)
        expect(account_memory.transactions).to eq([{ date: "09/09/2020", type: true, amount: Account::EXAMPLE_AMOUNT, balance: Account::EXAMPLE_AMOUNT }])
    end

    it 'saves a transaction with date, type, amount and balance into a hash' do
        stub_date("09/09/2020")
        account_memory.save_debit_transaction(100, -100)
        expect(account_memory.transactions).to eq([{ date: "09/09/2020", type: false, amount: Account::EXAMPLE_AMOUNT, balance: -Account::EXAMPLE_AMOUNT }])
    end

    it 'can save multiple transactions to the transactions array' do
        stub_date("09/09/2020")
        account_memory.save_credit_transaction(100, 100)
        stub_date("10/09/2020")
        account_memory.save_credit_transaction(100, 100)
        expect(account_memory.transactions).to eq([{ date: "09/09/2020", type: true, amount: Account::EXAMPLE_AMOUNT, balance: Account::EXAMPLE_AMOUNT }, { date: "10/09/2020", type: true, amount: Account::EXAMPLE_AMOUNT, balance: Account::EXAMPLE_AMOUNT }])
    end
end
