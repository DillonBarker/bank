require 'account'
require 'account_memory'
require 'printer'

describe 'User Journey' do
    let(:printer) { Printer.new() }
    let(:account_memory) { AccountMemory.new(printer) }
    let(:account) { Account.new(account_memory) }

    def stub_date(chosen_date)
        now = Time.parse(chosen_date)
        allow(Time).to receive(:now) { now }
    end

    it 'meets the acceptance criteria of the challenge' do
        stub_date("10/01/2012")
        account.deposit(1000)
        stub_date("13/01/2012")
        account.deposit(2000)
        stub_date("14/01/2012")
        account.withdraw(500)
        expect(account.print).to eq ("date || credit || debit || balance\n14/01/2012  ||  || 500.00 ||  2500.00\n13/01/2012  ||  2000.00  ||  ||  3000.00\n10/01/2012  ||  1000.00  ||  ||  1000.00")
    end
end