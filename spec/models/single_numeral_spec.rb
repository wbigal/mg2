require 'spec_helper'

describe SingleNumeral do
  let(:single_numeral) { build(:single_numerals) }

  context 'constructor' do
    it "default values" do
      expect(single_numeral).to have_attributes(sentence: DEFAULT_SENTENCE)
    end
  end

  it '.is_single_numeral?' do
    expect(SingleNumeral.is_single_numeral?(DEFAULT_SENTENCE)).to be_truthy
  end

  it '#information' do
    expect(single_numeral.information).to eq('glob')
  end

  it '#value' do
    expect(single_numeral.value).to eq('I')
  end

  it '#int_value' do
    expect(single_numeral.int_value).to eq(1)
  end
end
