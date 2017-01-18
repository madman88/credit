require_relative '../lib/credit_card'

describe CreditCard do
  describe "initialization" do
    params1 = { name: 'madhu', number: '4111111111111111', credit_limit: 1000}
    params2 = { name: 'madhu', number: '12345', credit_limit: 1000}
    params3 = { number: '12345', credit_limit: 1000}
    let(:cc1){ CreditCard.new(params1) }
    let(:cc2){ CreditCard.new(params2) }
    let(:cc3){ CreditCard.new(params3) }

    it "credit card should be valid" do
      expect(cc1.valid?).to be true
    end

    it "credit card should be invalid" do
      expect(cc2.valid?).to be false
    end

    it "credit card should be invalid" do
      expect(cc3.valid?).to be false
    end
  end

  describe "transactions" do
    params = { name: 'madhu', number: 4111111111111111, credit_limit: 1000}
    let(:cc){ CreditCard.new(params) }

    it "increases the balance by the amount of charges" do
      cc.charge(200)
      cc.charge(100)
      expect(cc.balance).to eq(300)
    end

    it "ignores charges beyond the credit limit" do
      cc.charge(500)
      cc.charge(800)
      expect(cc.balance).to eq(500)
    end

    it "decreases the balance by the amount of credits" do
      cc.credit(100)
      expect(cc.balance).to eq(-100)
    end

    it "handles both credit and charges to the same card" do
      cc.credit(100)
      cc.charge(7)
      expect(cc.balance).to eq(-93)
    end
  end

end
