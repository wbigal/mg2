require 'spec_helper'

describe CreditAwnser do
  #let(:credit_awnser) { build(:credit_awnsers) }

  #context 'constructor' do
  #  it "default values" do
  #    expect(credit).to have_attributes(sentence: CREDIT_SENTENCE)
  #  end
  #end

  it '.is_credit_question?' do
    expect(CreditAwnser.is_credit_question?('how many Credits is glob prok Silver ?')).to be_truthy
  end
end
