class AccountMemory

    attr_reader :transaction

    def initialize
        @transaction = {}
        @transactions = []
    end

    def save_credit_transaction(amount, balance)
        @transaction[:date] = Time.now.strftime("%d/%m/%Y")
        @transaction[:type] = 'credit'
        @transaction[:amount] = amount
        @transaction[:balance] = balance
    end

    def save_debit_transaction(amount, balance)
        @transaction[:date] = Time.now.strftime("%d/%m/%Y")
        @transaction[:type] = 'credit'
        @transaction[:amount] = amount
        @transaction[:balance] = balance
    end
end