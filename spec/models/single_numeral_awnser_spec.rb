require 'spec_helper'

describe SingleNumeralAwnser do
  #let(:credit_awnser) { build(:credit_awnsers) }

  #context 'constructor' do
  #  it "default values" do
  #    expect(credit).to have_attributes(sentence: CREDIT_SENTENCE)
  #  end
  #end

  it '.is_single_numeral_question?' do
    expect(SingleNumeralAwnser.is_single_numeral_question?('how much is pish tegj glob glob ?')).to be_truthy
  end
end
