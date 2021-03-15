# frozen_string_literal: true

# top-level module documentation comment
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    # TODO: use the integers in nums_a to validate its last check digit
    sum = 0
    nums_a.reverse.each_with_index do |num, index|
      if index.odd?
        num *= 2
        num = num % 10 + num / 10 if num >= 10
      end
      sum += num
    end
    sum.modulo(10).zero?
  end
end
