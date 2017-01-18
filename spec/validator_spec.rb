require_relative '../lib/validator'

describe Validator do
  describe "#valid_number?" do
    it "credit card number should be invalid" do
      expect(Validator::valid_number?('21321312')).to be false
    end

    it "credit card number should be valid" do
      expect(Validator::valid_number?(79927398713)).to be true
    end

    it "credit card number should be invalid" do
      expect(Validator::valid_number?('79927398714')).to be false
    end

    it "credit card number should be invalid" do
      expect(Validator::valid_number?('1234567890123456')).to be false
    end

    it "credit card number should be invalid" do
      expect(Validator::valid_number?('12345678901234567890')).to be false
    end
  end
end
