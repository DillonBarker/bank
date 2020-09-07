class AccountMemory

    attr_reader :transaction, :transactions, :printer

    def initialize(printer = Printer.new)
        @printer = printer
        @transaction = {}
        @transactions = []
    end

    def save_credit_transaction(amount, balance)
        @transaction[:date] = Time.now.strftime("%d/%m/%Y")
        @transaction[:type] = true
        @transaction[:amount] = amount
        @transaction[:balance] = balance
        save_to_transactions(@transaction)
        @transaction = {}
    end

    def save_debit_transaction(amount, balance)
        @transaction[:date] = Time.now.strftime("%d/%m/%Y")
        @transaction[:type] = false
        @transaction[:amount] = amount
        @transaction[:balance] = balance
        save_to_transactions(@transaction)
        @transaction = {}
    end

    def save_to_transactions(transaction)
        @transactions << transaction
    end

end