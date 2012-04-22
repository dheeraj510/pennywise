FactoryGirl.define do

  factory :item do
    name    "Capital One"
    type    { ["expense", "income"].sample }
  end
end