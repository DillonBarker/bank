class Printer

    def print_statement_header
        return "date || credit || debit || balance"
    end

    def print_statement(transactions)
        print_statement_header
        transactions.map do |key, value|
            value
        end
    end
    
end