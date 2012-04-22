FactoryGirl.define do

  factory :item do
    name    "Capital One"
    type    { ["expense", "income"].sample }
  end

  factory :transaction_entry do
    item
    type            { ["deposit", "autodraft", "atm", "check", "transfer", "checkcard"].sample }
    check_number    { SecureRandom.random_number(1e4.to_i) }
    memo            { "Payment 1/144" }
    cleared         { false }
    transacted_at   { Time.now }
    cleared_at      nil
  end
end