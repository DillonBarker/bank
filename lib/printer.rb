class Printer

    def print_statement_header
        return "date || credit || debit || balance"
    end

    def print_statement(transactions)
        print_statement_header
        transactions[1..-1].map do |transaction|
                "#{date} + " || " + #{amount} + " || " + " || " + #{balance}"
            else
                "#{date} + " || " + " || " + #{amount} + " || " + #{balance}"
            end
        end
    end
    
end