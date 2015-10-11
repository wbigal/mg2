class InputService

  attr_reader :output

  def initialize
    @output = []
  end

  def input value
    return if (value.nil?)
    if (value.strip.end_with?('?'))
      output << awnser(value)
    else
      Knowledge.instance.learn value
    end

    true
  end

  private

  def awnser value
    begin
      question = Question.new(value)
      question.awnser
    rescue DidNotUnderstandError
      'I have no idea what you are talking about'
    rescue InvalidRomanNumeralError
      'I do not this roman numeral'
    rescue
      'Ops...'
    end
  end
end
