DEFAULT_SENTENCE = 'glob is I'
CREDIT_SENTENCE = 'glob glob Silver is 34 Credits'

FactoryGirl.define do
  factory :assertions, class: Assertion do
    transient do
      sentence DEFAULT_SENTENCE
    end

    initialize_with do
      new(sentence)
    end
  end

  factory :assertions_credits, class: Assertion do
    transient do
      sentence CREDIT_SENTENCE
    end

    initialize_with do
      new(sentence)
    end
  end

  factory :assertions_single_numerals, class: Assertion do
    transient do
      sentence DEFAULT_SENTENCE
    end

    initialize_with do
      new(sentence)
    end
  end
end
