class Question

  attr_reader :phrase

  def initialize phrase
    @phrase = phrase
  end

  def is_credit_question?
    CreditAwnser.is_credit_question? @phrase
  end

  def is_single_numeral_question?
    SingleNumeralAwnser.is_single_numeral_question? @phrase
  end

  def awnser
    if is_single_numeral_question?
      SingleNumeralAwnser.new(self).value
    elsif is_credit_question?
      CreditAwnser.new(self).value
    end
  end
end
