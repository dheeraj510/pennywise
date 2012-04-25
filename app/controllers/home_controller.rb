class HomeController < ApplicationController

  def index
    @items = Item.all
    @transactions = TransactionEntry.all
  end
end
