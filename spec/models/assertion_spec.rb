require 'spec_helper'

describe Assertion do
  let(:assertion) { build(:assertions) }
  let(:assertion_credit) { build(:assertions_credits) }
  let(:assertions_single_numeral) { build(:assertions_single_numerals) }

  context 'constructor' do
    it "default values" do
      expect(assertion).to have_attributes(sentence: DEFAULT_SENTENCE)
    end
  end

  it '#is_credits?' do
    expect(assertion_credit.is_credits?).to be_truthy
    expect(assertion_credit.is_single_numeral?).to be_falsey
  end

  it '#is_single_numeral?' do
    expect(assertions_single_numeral.is_single_numeral?).to be_truthy
    expect(assertions_single_numeral.is_credits?).to be_falsey
  end
end
