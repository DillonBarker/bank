require 'printer'

describe Printer do 
    let(:printer) { Printer.new() }
    
    it 'prints out an empty statement, with columns date, credit, debit and balance' do
        expect(printer.print_statement_header).to eq("date || credit || debit || balance")
    end

   

end