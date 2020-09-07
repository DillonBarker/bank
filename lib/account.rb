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
        save_credit_transaction
    end
    
    def withdraw(amount)
        @balance -= amount
        save_debit_transaction
    end

    def save_credit_transaction
        @account_memory.transactions[:date] = Time.now.strftime("%d/%m/%Y")
    end

    def save_debit_transaction
        @account_memory.transactions[:date] = Time.now.strftime("%d/%m/%Y")
    end

    def get_balance
        @balance
    end
end