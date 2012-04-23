class Item < ActiveRecord::Base
  has_many :transaction_entries, dependent: :destroy

  attr_accessible :name, :item_type

  ITEM_TYPES = ["expense", "income"]

  validates :name, :item_type, presence: true
  validates :name, uniqueness: { scope: :item_type,
                               message: "Item already exists" }
  validates :item_type, inclusion: { in: ITEM_TYPES, message: "not valid" }
end
