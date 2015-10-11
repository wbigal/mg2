class Credit
  CREDIT_PATTERN = /(\w*) is (\d*) Credits$/.freeze

  attr_reader :sentence
  attr_reader :value
  attr_reader :information

  def initialize(sentence)
    @sentence = sentence
    @information = @sentence.match(CREDIT_PATTERN)[1]
    @value = @sentence.match(CREDIT_PATTERN)[2].to_f
  end

  def unit_value
    @value / denominator.to_f
  end

  def self.is_credits? sentence
    sentence =~ CREDIT_PATTERN
  end

  private

  def denominator
    words = @sentence.split(@information).first.scan(/[[:alpha:]]+/)
    roman_numeral = ''

    words.each do |word|
      roman_numeral += Knowledge.instance.value(word)
    end

    RomanNumeral.new(roman_numeral).int_value
  end
end
