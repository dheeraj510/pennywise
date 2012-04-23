class RenameTypeToItemType < ActiveRecord::Migration
  def up
    remove_index  :items, column: [:name, :type]
    rename_column :items, :type, :item_type
    add_index :items, [:name, :item_type], unique: true
  end

  def down
    remove_index  :items, column: [:name, :item_type]
    rename_column :items, :item_type, :type
    add_index :items, [:name, :type], unique: true
  end
end
