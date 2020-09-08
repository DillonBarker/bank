require 'account'
require 'account_memory'
require 'printer'

describe 'User Journey' do
    let(:printer) { Printer.new() }
    let(:account_memory) { AccountMemory.new(printer) }
    let(:account) { Account.new(account_memory) }
    let(:time_now) { Time.now.strftime('%d/%m/%Y') }
    
    it 'meets the acceptance criteria of the challenge' do
        account.deposit(1000)
        account.deposit(2000)
        account.withdraw(500)
        expect(account.print).to eq ("date || credit || debit || balance\n#{time_now}  ||  || 500 ||  2500\n#{time_now}  ||  2000  ||  ||  3000\n#{time_now}  ||  1000  ||  ||  1000")
    end
end