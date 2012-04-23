class TransactionEntriesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @transactions = @item.transaction_entries
  end

  def new
    @item = Item.find(params[:item_id])
    @transaction = @item.transaction_entries.new
  end

  def create
    @item = Item.find(params[:item_id])
    @transaction = @item.transaction_entries.new(params[:transaction_entry])

    if @transaction.save
      redirect_to item_transactions_path, status: :moved_permanently
    else
      render action: "new", status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:item_id])
    @transaction = TransactionEntry.find(params[:id])
  end

  def edit
    @item = Item.find(params[:item_id])
    @transaction = TransactionEntry.find(params[:id])
  end

  def update
    @item = Item.find(params[:item_id])
    @transaction = TransactionEntry.find(params[:id])

    if @transaction.update_attributes(params[:transaction_entry])
      redirect_to item_transactions_path, status: :moved_permanently
    else
      render action: "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    @transaction = TransactionEntry.find(params[:id])
    @transaction.destroy

    redirect_to item_transactions_path, status: :moved_permanently
  end
end