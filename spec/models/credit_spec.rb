require 'spec_helper'

describe Credit do
  let(:credit) { build(:credits) }

  before(:each) do
    Knowledge.instance.learn DEFAULT_SENTENCE
  end

  context 'constructor' do
    it "default values" do
      expect(credit).to have_attributes(sentence: CREDIT_SENTENCE)
    end
  end

  it '.is_credits?' do
    expect(Credit.is_credits?(CREDIT_SENTENCE)).to be_truthy
  end

  it '#information' do
    expect(credit.information).to eq('Silver')
  end

  it '#value' do
    expect(credit.value).to eq(34)
  end

  it '#int_value' do
    expect(credit.unit_value).to eq(17)
  end
end
