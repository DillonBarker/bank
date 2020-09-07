class Account

    STARTING_BALANCE = 0
    EXAMPLE_AMOUNT = 100

    attr_reader :balance, :account_memory

    def initialize(account_memory = AccountMemory.new)
        @account_memory = account_memory
        @balance = STARTING_BALANCE
    end

    def deposit(amount)
        @balance += amount
        balance = @balance
        @account_memory.save_credit_transaction(amount, balance)
    end
    
    def withdraw(amount)
        @balance -= amount
        balance = @balance
        @account_memory.save_debit_transaction(amount, balance)
    end

    def print
        data = @account_memory.transactions 
        @account_memory.printer.print_statement(data)
    end

    def get_balance
        @balance
    end
    
end