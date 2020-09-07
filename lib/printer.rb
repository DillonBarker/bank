class Printer

    def print_statement_header
        return "date || credit || debit || balance"
    end

    def print_statement(transactions)
        statement = transactions.map do |transaction|
            if transaction[:type] == true
                "#{transaction[:date]}  ||  #{transaction[:amount]}  ||  ||  #{transaction[:balance]}"
            else transaction[:type] == false
                "#{transaction[:date]}  ||  || #{transaction[:amount]} ||  #{transaction[:balance]}"
            end
        end
        print print_statement_header + "\n" + statement.join("\n")
        print_statement_header + "\n" + statement.join("\n")
    end
    
end