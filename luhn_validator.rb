module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    # TODO: use the integers in nums_a to validate its last check digit
    ((nums_a.reverse.map.with_index do |digit, index|
        ((index.odd? ? 2 : 1) * digit)
          .to_s.chars.map(&:to_i).sum
      end).sum.modulo(10)).zero?
  end
end
