class RenameTypeToEntryType < ActiveRecord::Migration
  def up
    rename_column :transaction_entries, :type, :entry_type
  end

  def down
    rename_column :transaction_entries, :entry_type, :type
  end
end
