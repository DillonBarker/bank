class AccountMemory
    attr_reader :transaction, :transactions, :printer

    def initialize(printer = Printer.new)
        @printer = printer
        @transactions = []
    end

    def save_credit_transaction(transaction)
        @transactions << transaction
    end

    def save_debit_transaction(transaction)
        @transactions << transaction
    end

end
