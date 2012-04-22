class TransactionEntry < ActiveRecord::Base
  belongs_to :item

  attr_accessible :check_number, :item_id, :memo, :transacted_at, :type
end
