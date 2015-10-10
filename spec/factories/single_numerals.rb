FactoryGirl.define do
  factory :single_numerals, class: SingleNumeral do
    transient do
      sentence DEFAULT_SENTENCE
    end

    initialize_with do
      new(sentence)
    end
  end
end
