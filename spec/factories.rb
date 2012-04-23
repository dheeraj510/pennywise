FactoryGirl.define do

  factory :item do
    name          { Forgery(:name).company_name }
    item_type     { Item::ITEM_TYPES.sample }
  end

  factory :transaction_entry do
    item
    entry_type      { TransactionEntry::ENTRY_TYPES.sample }
    check_number    { SecureRandom.random_number(1e4.to_i) }
    memo            { "Payment 1/144" }
    cleared         { false }
    transacted_at   { Time.now }
    cleared_at      nil
  end
end