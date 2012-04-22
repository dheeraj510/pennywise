class Item < ActiveRecord::Base
  has_many :transaction_entries

  attr_accessible :name, :type
end
