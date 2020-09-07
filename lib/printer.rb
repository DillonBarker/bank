class Printer
    
    def print_statement_header
        return "date || credit || debit || balance"
    end

    def print_statement
        time = Time.now.strftime("%d/%m/%Y")
        return print_statement_header + " \n " +
        time
    end
    
end