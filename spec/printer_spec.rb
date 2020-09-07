require 'printer'

describe Printer do 
    let(:printer) { Printer.new() }
    
    it 'prints out an empty statement, with columns date, credit, debit and balance' do
        expect(printer.print_statement_header).to eq("date || credit || debit || balance")
    end

    it 'prints out an empty statement, and an empty transaction (row)' do
        expect(printer.print_statement).to eq ("date || credit || debit || balance \n  ||  ||  || ")
    end

end