FactoryGirl.define do
  factory :credits, class: Credit do
    transient do
      sentence CREDIT_SENTENCE
    end

    initialize_with do
      new(sentence)
    end
  end
end
