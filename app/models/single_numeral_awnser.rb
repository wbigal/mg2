class SingleNumeralAwnser
  SINGLE_NUMERAL_QUESTION_PATTERN = /^how much is\s+(.+)[ ?]$/.freeze

  attr_reader :question
  attr_reader :value

  def initialize question
    @question = question
    @sentence = @question.phrase.match(SINGLE_NUMERAL_QUESTION_PATTERN)[1].strip
    @value = calculate_value
  end

  def awnser
    "#{@sentence} is #{@value}"
  end

  def self.is_single_numeral_question? question
    question =~ SINGLE_NUMERAL_QUESTION_PATTERN
  end

  private

  def calculate_value
    words = @sentence.scan(/[[:alpha:]]+/)
    roman_numeral = ''

    words.each do |word|
      roman_numeral += Knowledge.instance.value(word)
    end

    RomanNumeral.new(roman_numeral).int_value
  end
end
