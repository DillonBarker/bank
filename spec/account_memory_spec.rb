require 'account_memory'

describe AccountMemory do

    let(:account_memory) { AccountMemory.new() }

    it 'initializes with an empty hash attribute' do
        expect(account_memory.transactions).to eq ({})
    end
end