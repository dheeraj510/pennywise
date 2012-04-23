class AddAmountToTransactionEntry < ActiveRecord::Migration
  def change
    add_column :transaction_entries, :amount, :integer
  end
end
