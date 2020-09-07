class Printer

    def print_statement_header
        return "date || credit || debit || balance"
    end

    def print_statement(transactions)
        print_statement_header
        transactions.map do |transaction|
            return "#{transaction[:date]}  ||  #{transaction[:amount]}  ||  ||  #{transaction[:balance]}"
        end
    end
    
end