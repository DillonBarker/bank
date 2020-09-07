require 'account_memory'

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
        @account_memory.save_credit_transaction(amount, @balance)
    end
    
    def withdraw(amount)
        @balance -= amount
        @account_memory.save_debit_transaction(amount, @balance)
    end

    def get_balance
        @balance
    end
end