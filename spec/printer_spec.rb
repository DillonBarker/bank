require 'printer'

describe Printer do
    let(:printer) { Printer.new }
    let(:credit_transaction) { double :transaction, date: "10/10/2020", type: true, amount: 100, balance: 100 }
    let(:credit_transaction2) { double :transaction, date: "10/10/2020", type: true, amount: 100, balance: 200 }
    let(:credit_transaction3) { double :transaction, date: "10/10/2020", type: true, amount: 100, balance: 300 }
    let(:debit_transaction) { double :transaction, date: "10/10/2020", type: false, amount: 100, balance: 0 }


    it 'prints out an empty statement, with columns date, credit, debit and balance' do
        expect(printer.print_statement_header).to eq('date || credit || debit || balance')
    end

    it 'prints a statement' do
        expect(printer.print_statement([credit_transaction])).to eq("date || credit || debit || balance\n10/10/2020  ||  100.00  ||  ||  100.00")
    end

    it 'can print a statement with 2 transactions' do
        expect(printer.print_statement([credit_transaction, credit_transaction2])).to eq("date || credit || debit || balance\n10/10/2020  ||  100.00  ||  ||  200.00\n10/10/2020  ||  100.00  ||  ||  100.00")
        expect(printer.print_statement([credit_transaction, debit_transaction])).to eq("date || credit || debit || balance\n10/10/2020  ||  || 100.00 ||  0.00\n10/10/2020  ||  100.00  ||  ||  100.00")
    end

    it 'can print a statement with multiple transactions' do
        expect(printer.print_statement([credit_transaction,
            credit_transaction2,
            credit_transaction3])).to eq("date || credit || debit || balance\n10/10/2020  ||  100.00  ||  ||  300.00\n10/10/2020  ||  100.00  ||  ||  200.00\n10/10/2020  ||  100.00  ||  ||  100.00")
    end
end
