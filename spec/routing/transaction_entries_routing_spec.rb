require 'spec_helper'

describe TransactionEntriesController do

  before(:each) do
    @item_id = SecureRandom.random_number(1e8.to_i)
    @id = SecureRandom.random_number(1e9.to_i)
  end

  describe "routing" do

    context "when valid" do

      it ":get '/items/:item_id/transactions' should route to transaction_entries#index" do
        { get: "/items/#{@item_id}/transactions" }.should route_to("transaction_entries#index", item_id: "#{@item_id}")
      end

      it ":get '/items/:item_id/transactions/new' should route to transaction_entries#new" do
        { get: "/items/#{@item_id}/transactions/new" }.should route_to("transaction_entries#new", item_id: "#{@item_id}")
      end

      it ":post '/items/:item_id/transactions' should route to transaction_entries#create" do
        { post: "/items/#{@item_id}/transactions" }.should route_to("transaction_entries#create", item_id: "#{@item_id}")
      end

      it ":get '/items/:item_id/transactions/:id/' should route to transaction_entries#show" do
        { get: "/items/#{@item_id}/transactions/#{@id}" }.should route_to("transaction_entries#show", item_id: "#{@item_id}", id: "#{@id}")
      end

      it ":get '/items/:item_id/transactions/:id/edit' should route to transaction_entries#edit" do
        { get: "/items/#{@item_id}/transactions/#{@id}/edit" }.should route_to("transaction_entries#edit", item_id: "#{@item_id}", id: "#{@id}")
      end

      it ":put 'items/:item_id/transactions/:id' should route to transaction_entries#update" do
        { put: "/items/#{@item_id}/transactions/#{@id}" }.should route_to("transaction_entries#update", item_id: "#{@item_id}", id: "#{@id}")
      end

      it ":delete 'items/:item_id/transactions/:id' should route to transaction_entries#destroy" do
        { delete: "/items/#{@item_id}/transactions/#{@id}" }.should route_to("transaction_entries#destroy", item_id: "#{@item_id}", id: "#{@id}")
      end
    end

    context "when invalid" do

      context "given a non-integer :item_id and :id for an otherwise valid route" do

        it ":get '/items/one/transactions/two' should not be routable" do
          { get: "/items/one/transactions/two" }.should_not be_routable
        end

        it ":get '/items/one/transactions/two/edit' should not be routable" do
          { get: "/items/one/transactions/two/edit" }.should_not be_routable
        end

        it ":put '/items/one/transactions/two' should not be routable" do
          { put: "/items/one/transactions/two" }.should_not be_routable
        end

        it ":delete '/items/one/transactions/two' should not be routable" do
          { delete: "/items/one/transactions/two" }.should_not be_routable
        end
      end
    end
  end
end