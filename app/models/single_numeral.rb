class SingleNumeral
  SINGLE_NUMERAL_PATTERN = /^(\w*) is (\w*)$/.freeze

  attr_reader :sentence
  attr_reader :value
  attr_reader :information

  def initialize(sentence)
    @sentence = sentence
    @information = @sentence.match(SINGLE_NUMERAL_PATTERN)[1]
    @value = @sentence.match(SINGLE_NUMERAL_PATTERN)[2]
  end

  def int_value
    rn = RomanNumeral.new(@value)
    rn.int_value
  end

  def self.is_single_numeral? sentence
    sentence =~ SINGLE_NUMERAL_PATTERN
  end
end
