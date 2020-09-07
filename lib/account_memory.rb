class AccountMemory

    attr_reader :transaction, :transactions

    def initialize(printer = Printer.new)
        @printer = printer
        @transaction = {}
        @transactions = []
    end

    def save_credit_transaction(amount, balance)
        @transaction[:date] = Time.now.strftime("%d/%m/%Y")
        @transaction[:type] = 'credit'
        @transaction[:amount] = amount
        @transaction[:balance] = balance
        save_to_transactions(@transaction)
    end

    def save_debit_transaction(amount, balance)
        @transaction[:date] = Time.now.strftime("%d/%m/%Y")
        @transaction[:type] = 'credit'
        @transaction[:amount] = amount
        @transaction[:balance] = balance
        save_to_transactions(@transaction)
    end

    def save_to_transactions(transaction)
        @transactions << transaction
    end

end