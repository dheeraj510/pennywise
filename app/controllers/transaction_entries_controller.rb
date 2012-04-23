class TransactionEntriesController < ApplicationController

  def index
  end

  def new
  end

  def create
    redirect_to transactions_path, status: :moved_permanently
  end

  def show
  end

  def edit
  end

  def update
    redirect_to transactions_path, status: :moved_permanently
  end

  def destroy
    redirect_to transactions_path, status: :moved_permanently
  end
end