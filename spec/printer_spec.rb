require 'printer'

describe Printer do 
    it 'prints out an empty statement, with columns date, credit, debit and balance' do
        printer = Printer.new()
        expect(printer.print_statement_header).to eq("date || credit || debit || balance")
    end
end