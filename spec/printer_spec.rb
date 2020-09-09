require 'printer'

describe Printer do
    let(:printer) { Printer.new }

    it 'prints out an empty statement, with columns date, credit, debit and balance' do
        expect(printer.print_statement_header).to eq('date || credit || debit || balance')
    end

    it 'prints a statement' do
        expect(printer.print_statement([{date: "10/10/2010", type: true, amount: 100, balance: 100 }])).to eq("date || credit || debit || balance\n10/10/2010  ||  100.00  ||  ||  100.00")
    end

    it 'can print a statement with 2 transactions' do
        expect(printer.print_statement([{ date: "10/10/2010", type: true, amount: 100, balance: 100 },
                                        { date: "10/10/2010", type: true, amount: 100, balance: 200 }])).to eq("date || credit || debit || balance\n10/10/2010  ||  100.00  ||  ||  200.00\n10/10/2010  ||  100.00  ||  ||  100.00")
        expect(printer.print_statement([{ date: "10/10/2010", type: true, amount: 100, balance: 100 },
                                        { date: "10/10/2010", type: false, amount: 100, balance: 0  }])).to eq("date || credit || debit || balance\n10/10/2010  ||  || 100.00 ||  0.00\n10/10/2010  ||  100.00  ||  ||  100.00")
    end

    it 'can print a statement with multiple transactions' do
        expect(printer.print_statement([{ date: "10/10/2010", type: true, amount: 100, balance: 100 },
                                        { date: "10/10/2010", type: true, amount: 100, balance: 200 },
                                        { date: "10/10/2010", type: true, amount: 100, balance: 300 }])).to eq("date || credit || debit || balance\n10/10/2010  ||  100.00  ||  ||  300.00\n10/10/2010  ||  100.00  ||  ||  200.00\n10/10/2010  ||  100.00  ||  ||  100.00")
    end
end
