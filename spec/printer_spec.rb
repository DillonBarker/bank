require 'printer'

describe Printer do 
    let(:printer) { Printer.new() }
    let(:time_now) { Time.now.strftime("%d/%m/%Y") }
    
    it 'prints out an empty statement, with columns date, credit, debit and balance' do
        expect(printer.print_statement_header).to eq("date || credit || debit || balance")
    end

    it 'prints a statement' do
        expect(printer.print_statement([{date: time_now, type: 'credit', amount: 100, balance: 100 }])).to eq("date || credit || debit || balance\n07/09/2020  ||  100  ||  ||  100")
    end

end