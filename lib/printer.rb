class Printer
    
    def print_statement_header
        return "date || credit || debit || balance"
    end

    def print_statement
        return print_statement_header + " \n " +
        "01/01/2020"
    end
    
end