require_relative '../lib/credit_card'
require_relative '../lib/credit_client'

describe CreditClient do
  let(:params) do {
      name: "Tom",
      number: 4111111111111111,
      credit_limit: 1000
    }
  end
  let(:card) { CreditCard.new(params) }
  let(:cards) { { params[:name] => card } }
  let(:tokens_add) { ["Add", "Tom", "4111111111111111", "$1000"] }
  let(:token_charge) { ["Charge", "Tom", "$500"] }
  let(:token_credit) { ["Credit", "Tom", "$500"] }

  describe "#add" do
    it "adds a new card to the accounts/cards hash" do
      CreditClient.add(tokens_add,cards)
      expect(cards.keys).to include('Tom')
    end
  end

  describe '#charge' do
    it 'charges the correct card' do
      expect(card).to receive(:charge).with(500)
      CreditClient.charge(token_charge,cards)
    end
  end

  describe '#credit' do
    it 'credits the correct card' do
      expect(card).to receive(:credit).with(500)
      CreditClient.credit(token_credit,cards)
    end
  end
end
