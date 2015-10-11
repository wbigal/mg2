CREDIT_QUESTION = 'how many Credits is glob prok Silver ?'
SIGLE_NUMERAL_QUESTION = 'how much is pish tegj glob glob ?'

FactoryGirl.define do
  factory :questions, class: Question do
    transient do
      phrase CREDIT_QUESTION
    end

    initialize_with do
      new(phrase)
    end
  end

  factory :assertions_single_numeral, class: Question do
    transient do
      phrase SIGLE_NUMERAL_QUESTION
    end

    initialize_with do
      new(phrase)
    end
  end
end
