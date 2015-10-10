ROMAN_1910_VALUE = 'MCMX'

FactoryGirl.define do
  factory :roman_numerals, class: RomanNumeral do
    transient do
      roman_value ROMAN_1910_VALUE
    end

    initialize_with do
      new(roman_value)
    end
  end

  factory :roman_numerals_invalid, class: RomanNumeral do
    transient do
      roman_value 'XXXXIX'
    end

    initialize_with do
      new(roman_value)
    end
  end
end
