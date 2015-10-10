require 'spec_helper'

describe RomanNumeral do
  let(:roman_numeral) { build(:roman_numerals) }

  context 'constructor' do
    it "default values" do
      expect(roman_numeral).to have_attributes(roman_value: ROMAN_1910_VALUE)
    end

    it 'invalid roman numeral' do
      expect { build(:roman_numerals_invalid) }.to raise_error(InvalidRomanNumeralError)
    end
  end

  context '#int_value' do
    it 'success convert' do
      expect(roman_numeral.int_value).to eq(1910)
    end
  end
end
