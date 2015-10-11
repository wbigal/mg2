require 'spec_helper'

describe Question do
  let(:assertion_credit) { build(:questions) }
  let(:assertions_single_numeral) { build(:assertions_single_numeral) }

  before(:each) do
    Knowledge.instance.learn 'glob is I'
    Knowledge.instance.learn 'prok is V'
    Knowledge.instance.learn 'pish is X'
    Knowledge.instance.learn 'tegj is L'
    Knowledge.instance.learn CREDIT_SENTENCE
  end

  it '#is_credit_question?' do
    expect(assertion_credit.is_credit_question?).to be_truthy
    expect(assertion_credit.is_single_numeral_question?).to be_falsey
  end

  it '#is_single_numeral_question?' do
    expect(assertions_single_numeral.is_single_numeral_question?).to be_truthy
    expect(assertions_single_numeral.is_credit_question?).to be_falsey
  end

  it '#awnser' do
    expect(assertion_credit.awnser).to be(68)
    expect(assertions_single_numeral.awnser).to be(42)
  end
end
