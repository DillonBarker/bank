require 'printer'

describe Printer do
    let(:printer) { Printer.new }
    let(:time_now) { Time.now.strftime('%d/%m/%Y') }

    it 'prints out an empty statement, with columns date, credit, debit and balance' do
        expect(printer.print_statement_header).to eq('date || credit || debit || balance')
    end

    it 'prints a statement' do
        expect(printer.print_statement([{date: time_now, type: true, amount: 100, balance: 100 }])).to eq("date || credit || debit || balance\n#{time_now}  ||  100.00  ||  ||  100.00")
    end

    it 'can print a statement with 2 transactions' do
        expect(printer.print_statement([{ date: time_now, type: true, amount: 100, balance: 100 },
                                        { date: time_now, type: true, amount: 100, balance: 200 }])).to eq("date || credit || debit || balance\n#{time_now}  ||  100.00  ||  ||  200.00\n#{time_now}  ||  100.00  ||  ||  100.00")
        expect(printer.print_statement([{ date: time_now, type: true, amount: 100, balance: 100 },
                                        { date: time_now, type: false, amount: 100, balance: 0  }])).to eq("date || credit || debit || balance\n#{time_now}  ||  || 100.00 ||  0.00\n#{time_now}  ||  100.00  ||  ||  100.00")
    end

    it 'can print a statement with multiple transactions' do
        expect(printer.print_statement([{ date: time_now, type: true, amount: 100, balance: 100 },
                                        { date: time_now, type: true, amount: 100, balance: 200 },
                                        { date: time_now, type: true, amount: 100, balance: 300 }])).to eq("date || credit || debit || balance\n#{time_now}  ||  100.00  ||  ||  300.00\n#{time_now}  ||  100.00  ||  ||  200.00\n#{time_now}  ||  100.00  ||  ||  100.00")
    end
end
