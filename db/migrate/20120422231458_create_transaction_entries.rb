class CreateTransactionEntries < ActiveRecord::Migration
  def change
    create_table :transaction_entries do |t|
      t.integer :item_id
      t.string :type
      t.integer :check_number
      t.string :memo
      t.boolean :cleared
      t.datetime :transacted_at
      t.datetime :cleared_at

      t.timestamps
    end
  end
end
