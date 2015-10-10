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
    @informations[information].value
  end
end
