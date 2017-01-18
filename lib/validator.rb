module Validator
  MIN_LENGTH = 12
  MAX_LENGTH = 19

  def self.valid_number?(number)
    num = number.to_s
    return false if (num.length < MIN_LENGTH && num.length > MAX_LENGTH)
    i = 1
    sum = 0
    num.reverse.each_char do |digit|
      if (i % 2 == 0)
        d1, d2 =  (2*(digit.to_i)).divmod(10)
        sum += d1 + d2
      else
        sum += digit.to_i
      end
      i += 1
    end
    (sum != 0 && sum % 10 == 0) ? true : false
  end
end
