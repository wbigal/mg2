class Assertion
  attr_reader :sentence

  def initialize(sentence)
    @sentence = sentence
  end

  def is_credits?
    Credit.is_credits? @sentence
  end

  def is_single_numeral?
    SingleNumeral.is_single_numeral? @sentence
  end

  def data
    if is_single_numeral?
      SingleNumeral.new(@sentence)
    elsif is_credits?
      Credit.new(@sentence)
    end
  end
end
