class SingleNumeralAwnser
  SINGLE_NUMERAL_QUESTION_PATTERN = /^how much is\s+(.+)[ ?]$/.freeze

  attr_reader :question

  def initialize question
    @question = question
  end

  def value
    sentence = @question.phrase.match(SINGLE_NUMERAL_QUESTION_PATTERN)[1].strip
    words = sentence.scan(/[[:alpha:]]+/)
    roman_numeral = ''

    words.each do |word|
      roman_numeral += Knowledge.instance.value(word)
    end

    RomanNumeral.new(roman_numeral).int_value
  end

  def self.is_single_numeral_question? question
    question =~ SINGLE_NUMERAL_QUESTION_PATTERN
  end
end
