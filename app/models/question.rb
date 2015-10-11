class Question

  attr_reader :phrase
  attr_reader :awnser_object

  def initialize phrase
    @phrase = phrase

    if is_single_numeral_question?
      @awnser_object = SingleNumeralAwnser.new(self)
    elsif is_credit_question?
      @awnser_object = CreditAwnser.new(self)
    else
      raise DidNotUnderstandError
    end
  end

  def is_credit_question?
    CreditAwnser.is_credit_question? @phrase
  end

  def is_single_numeral_question?
    SingleNumeralAwnser.is_single_numeral_question? @phrase
  end

  def float_awnser
    @awnser_object.value
  end
end
