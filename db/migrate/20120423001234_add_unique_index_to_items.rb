class AddUniqueIndexToItems < ActiveRecord::Migration
  def change
    add_index :items, [:name, :type], unique: true
  end
end
