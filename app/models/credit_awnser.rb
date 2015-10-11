class CreditAwnser
  CREDIT_QUESTION_PATTERN = /^how many Credits is\s+(.+)[ ?]$/.freeze

  attr_reader :question
  attr_reader :value

  def initialize question
    @question = question
    @sentence = @question.phrase.match(CREDIT_QUESTION_PATTERN)[1].strip
    @value = calculate_value
  end

  def awnser
    "#{@sentence} is #{@value.to_s.chomp('.0')} Credits"
  end

  def self.is_credit_question? question
    question =~ CREDIT_QUESTION_PATTERN
  end

  private

  def calculate_value
    words = @sentence.scan(/[[:alpha:]]+/)
    roman_numeral = ''

    for i in 0...(words.length - 1)
      roman_numeral += Knowledge.instance.value(words[i])
    end

    roman_numeral_value = roman_numeral == '' ? 1 : RomanNumeral.new(roman_numeral).int_value.to_f

    roman_numeral_value * Knowledge.instance.value(words.last)
  end
end
