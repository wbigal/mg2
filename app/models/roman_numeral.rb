class RomanNumeral
  NUMERALS = {
    'I' => 1,
    'V'=> 5,
    'X'=> 10,
    'L'=> 50,
    'C'=> 100,
    'D' => 500,
    'M' => 1000
  }.freeze

  attr_reader :roman_value

  def initialize(roman_value)
    validate(roman_value)
    @roman_value = roman_value
    @int_value = nil
  end

  def int_value
    return @int_value unless @int_value.nil?

    int_value = 0
    i = 0
    reverse = @roman_value.reverse

    while i < reverse.length
      next_value = NUMERALS[reverse[i + 1]].nil? ? 0 : NUMERALS[reverse[i + 1]]
      current_value = NUMERALS[reverse[i]]

      if (next_value < current_value)
        int_value += current_value - next_value
        i += 1
      else
        int_value += current_value
      end

      i += 1
    end

    @int_value = int_value
    @int_value
  end

  private

  def validate roman_value

    i = 0
    reverse = roman_value.reverse
    current_value = nil
    counter = 0

    while i < reverse.length
      if (current_value != reverse[i])
        counter = 0
      end
      counter += 1
      current_value = reverse[i]

      raise ArgumentError, 'The argument is not a roman numeral' if (counter >= 4)

      i += 1
    end
  end
end
