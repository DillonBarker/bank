require 'transaction'

describe Transaction do
    
    let(:transaction) { Transaction.new("10/10/2010", true, 100, 100) }

    it 'has attributes for the date, type of transaction, amount' do
        expect(transaction.date).to eq("10/10/2010")
        expect(transaction.type).to eq(true)
        expect(transaction.amount).to eq(100)
        expect(transaction.balance).to eq(100)
    end 

end