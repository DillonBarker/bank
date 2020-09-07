class Account

    STARTING_BALANCE = 0
    EXAMPLE_AMOUNT = 100

    attr_reader :balance

    def initialize
        @balance = STARTING_BALANCE
    end

    def deposit(amount)
        @balance += amount
    end
    
    def withdraw(amount)
        @balance -= amount
    end

    def get_balance
        @balance
    end
end