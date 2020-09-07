require 'printer'

describe Printer do 
    let(:printer) { Printer.new() }
    it 'prints out an empty statement, with columns date, credit, debit and balance' do
        expect(printer.print_statement_header).to eq("date || credit || debit || balance")
    end

    it 'prints out a transaction with a date following a statement header' do
        expect(printer.print_statement).to eq ("date || credit || debit || balance \n 01/01/2020")
    end
end