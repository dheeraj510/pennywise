class TransactionEntry < ActiveRecord::Base
  belongs_to :item

  attr_accessible :check_number, :item_id, :memo, :transacted_at, :entry_type, :cleared, :cleared_at

  ENTRY_TYPES = ["deposit", "autodraft", "atm", "check", "transfer", "checkcard"]

  validates :item_id, :entry_type, :transacted_at, presence: true
  validates :item_id, :check_number, numericality: true
  validates :entry_type, inclusion: { in: ENTRY_TYPES, message: "not valid" }
end
