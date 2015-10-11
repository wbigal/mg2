require 'spec_helper'

describe CreditAwnser do
  let(:question) { Question.new('how many Credits is glob prok Silver ?') }
  let(:credit_awnser) { CreditAwnser.new(question) }

  before(:each) do
    Knowledge.instance.learn 'glob is I'
    Knowledge.instance.learn 'prok is V'
    Knowledge.instance.learn 'glob glob Silver is 34 Credits'
  end

  it "fields" do
    expect(credit_awnser).to have_attributes(value: 68, question: question)
  end

  it '#float_awnser' do
    expect(credit_awnser.value).to eq(68)
  end

  it '#awnser' do
    expect(credit_awnser.awnser).to eq('glob prok Silver is 68 Credits')
  end

  it '.is_credit_question?' do
    expect(CreditAwnser.is_credit_question?('how many Credits is glob prok Silver ?')).to be_truthy
  end
end
