FactoryGirl.define do
  factory :review do
    author "Orin Scrivello"
    price 3
    rating 5
    content "This shop was great, I bought an AWESOME plant here"
    shop nil
  end
end
