require_relative '../lib/credit_card'

module CreditClient

  def self.add(tokens, accounts)
    params = {
      name: tokens[1],
      number: tokens[2],
      credit_limit: get_amount(tokens[3])
    }
    cc = CreditCard.new(params)
    accounts[cc.name] =  cc
  end

  def self.credit(tokens, accounts)
    cc = accounts[tokens[1]] unless accounts[tokens[1]] == 'error'
    cc.credit(get_amount(tokens[2])) if cc && cc.valid?
  end

  def self.charge(tokens, accounts)
    cc = accounts[tokens[1]] unless accounts[tokens[1]] == 'error'
    cc.charge(get_amount(tokens[2])) if  cc && cc.valid?
  end

  private

  def self.get_amount(amt)
    amt.tr('$','').to_i
  end
end
