require 'account_memory'

class Account

    STARTING_BALANCE = 0
    EXAMPLE_AMOUNT = 100

    attr_reader :balance, :transactions, :account_memory

    def initialize(account_memory = AccountMemory.new)
        @account_memory = account_memory
        @balance = STARTING_BALANCE
        @transactions = {}
    end

    def deposit(amount)
        @balance += amount
        save_transaction
    end
    
    def withdraw(amount)
        @balance -= amount
        save_transaction
    end

    def save_transaction
        @transactions[:date] = 1
        @transactions[:type] = 1
        @transactions[:amount] = 1
        @transactions[:balance] = 1
    end

    def get_balance
        @balance
    end
end