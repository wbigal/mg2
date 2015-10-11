require 'spec_helper'
require 'yaml'

describe RomanNumeral do
  let(:roman_numeral) { build(:roman_numerals) }

  context 'constructor' do
    it "default values" do
      expect(roman_numeral).to have_attributes(roman_value: ROMAN_1910_VALUE)
    end

    it 'invalid roman numeral' do
      expect { build(:roman_numerals_invalid) }.to raise_error(InvalidRomanNumeralError)
      expect { RomanNumeral.new('IVA') }.to raise_error(InvalidRomanNumeralError)
    end
  end

  context '#int_value' do
    it 'success convert' do
      expect(roman_numeral.int_value).to eq(1910)
    end
  end

  it 'test 1 until 3999' do
    numbers = YAML.load(File.new('spec/fixtures/roman_numbers.yml').read)

    for i in 1..3999
      rn = RomanNumeral.new(numbers[i])
      expect(rn.int_value).to eq(i)
    end
  end
end
