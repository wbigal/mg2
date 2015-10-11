require 'spec_helper'

describe SingleNumeralAwnser do
  let(:question) { Question.new('how much is pish tegj glob glob ?') }
  let(:single_numeral_awnser) { SingleNumeralAwnser.new(question) }

  before(:each) do
    Knowledge.instance.learn 'glob is I'
    Knowledge.instance.learn 'prok is V'
    Knowledge.instance.learn 'pish is X'
    Knowledge.instance.learn 'tegj is L'
  end

  it "fields" do
    expect(single_numeral_awnser).to have_attributes(value: 42, question: question)
  end

  it '#float_awnser' do
    expect(single_numeral_awnser.value).to eq(42)
  end

  it '#awnser' do
    expect(single_numeral_awnser.awnser).to eq('pish tegj glob glob is 42')
  end

  it '.is_single_numeral_question?' do
    expect(SingleNumeralAwnser.is_single_numeral_question?('how much is pish tegj glob glob ?')).to be_truthy
  end
end
