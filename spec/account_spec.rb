require 'account'

describe Account do
    it 'can return the balance of that account ( 0 ), using a method' do
        account = Account.new()
        expect(account.get_balance).to eq Account::STARTING_BALANCE
    end
end