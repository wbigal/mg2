require 'spec_helper'

describe InputService do
  it 'input output' do
    is = InputService.new
    is.input 'glob is I'
    is.input 'prok is V'
    is.input 'pish is X'
    is.input 'tegj is L'
    is.input 'how much is pish tegj glob glob ?'

    expect(is.output.first).to eq('pish tegj glob glob is 42')
  end
end
