class Knowledge
  class << self
    def instance
      @instance ||= new
    end

    private :new
  end

  attr_reader :informations

  def initialize
    @informations = {}
  end

  def learn sentence
    assertion = Assertion.new(sentence)
    @informations[assertion.data.information] = assertion.data
  end

  def value information
    obj = @informations[information]

    if (obj.kind_of?(SingleNumeral))
      obj.value
    elsif (obj.kind_of?(Credit))
      obj.unit_value
    end
  end
end
