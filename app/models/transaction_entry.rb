class TransactionEntry < ActiveRecord::Base
  belongs_to :item

  monetize :amount, as: "amount_value"

  attr_accessible :check_number, :item_id, :memo, :transacted_at, :entry_type, :cleared, :cleared_at, :amount

  ENTRY_TYPES = ["deposit", "autodraft", "atm", "check", "transfer", "checkcard"]

  validates :item_id, :entry_type, :transacted_at, :amount, presence: true
  validates :item_id, :amount, numericality: true
  validates :check_number, numericality: true, allow_nil: true
  validates :entry_type, inclusion: { in: ENTRY_TYPES, message: "not valid" }
end
