class TransactionEntriesController < ApplicationController

  def index
    @transactions = TransactionEntry.all
  end

  def new
    @transaction = TransactionEntry.new
  end

  def create
    @transaction = TransactionEntry.new(params[:item])

    if @transaction.save
      redirect_to transactions_path, status: :moved_permanently
    else
      render action: "new", status: :unprocessable_entity
    end
  end

  def show
    @transaction = TransactionEntry.find(params[:id])
  end

  def edit
    @transaction = TransactionEntry.find(params[:id])
  end

  def update
    @transaction = TransactionEntry.find(params[:id])

    if @transaction.update_attributes(params[:item])
      redirect_to transactions_path, status: :moved_permanently
    else
      render action: "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @transaction = TransactionEntry.find(params[:id])
    @transaction.destroy

    redirect_to transactions_path, status: :moved_permanently
  end
end