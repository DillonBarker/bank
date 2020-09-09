class Printer
    def print_statement_header
        'date || credit || debit || balance'
    end

    def print_statement(transactions)
        statement = transactions.map do |transaction|
            if transaction[:type] == true
                "#{transaction[:date]}  ||  #{transaction[:amount]}.00  ||  ||  #{transaction[:balance]}.00"
            else transaction[:type] == false
                 "#{transaction[:date]}  ||  || #{transaction[:amount]}.00 ||  #{transaction[:balance]}.00"
            end
        end
        print print_statement_header + "\n" + statement.reverse.join("\n")
        print_statement_header + "\n" + statement.reverse.join("\n")
    end
end
