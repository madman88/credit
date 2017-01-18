require_relative 'validator'

class CreditCard
  attr_accessor :name, :number, :credit_limit, :balance, :valid_number

  def initialize(options = {})
    @name = options.fetch(:name, nil)
    @number = options.fetch(:number, nil)
    @credit_limit = options.fetch(:credit_limit, 0)
    @balance =  0
  end

  def valid?
    Validator::valid_number?(number) && !name.nil?
  end

  def charge(amount)
    @balance += amount if @balance + amount < credit_limit
  end

  def credit(amount)
    @balance -= amount
  end

end
