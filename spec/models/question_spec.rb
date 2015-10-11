require 'spec_helper'

describe Question do
  let(:assertion_credit) { build(:questions) }
  let(:assertions_single_numeral) { build(:assertions_single_numeral) }

  before(:each) do
    Knowledge.instance.learn 'glob is I'
    Knowledge.instance.learn 'prok is V'
    Knowledge.instance.learn 'pish is X'
    Knowledge.instance.learn 'tegj is L'
    Knowledge.instance.learn 'glob glob Silver is 34 Credits'
    Knowledge.instance.learn 'glob prok Gold is 57800 Credits'
    Knowledge.instance.learn 'pish pish Iron is 3910 Credits'
  end

  it 'constructor fail' do
    expect {
      Question.new('how much wood could a woodchuck chuck if a woodchuck could chuck wood ?')
    }.to raise_error(DidNotUnderstandError)
  end

  it '#is_credit_question?' do
    expect(assertion_credit.is_credit_question?).to be_truthy
    expect(assertion_credit.is_single_numeral_question?).to be_falsey
  end

  it '#is_single_numeral_question?' do
    expect(assertions_single_numeral.is_single_numeral_question?).to be_truthy
    expect(assertions_single_numeral.is_credit_question?).to be_falsey
  end

  it '#float_awnser' do
    expect(Question.new('how much is pish tegj glob glob ?').float_awnser).to eq(42)
    expect(Question.new('how many Credits is glob prok Silver ?').float_awnser).to eq(68)
    expect(Question.new('how many Credits is glob prok Gold ?').float_awnser).to eq(57800)
    expect(Question.new('how many Credits is glob prok Iron ?').float_awnser).to eq(782)
  end
end
