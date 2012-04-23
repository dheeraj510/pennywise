require 'spec_helper'

describe TransactionEntriesController do

  before(:each) do
    @id = SecureRandom.random_number(1e9.to_i)
  end

  describe "routing" do

    context "when valid" do

      it ":get '/transactions' should route to transaction_entries#index" do
        { get: "/transactions" }.should route_to("transaction_entries#index")
      end

      it ":get '/transactions/new' should route to transaction_entries#new" do
        { get: "/transactions/new" }.should route_to("transaction_entries#new")
      end

      it ":post '/transactions' should route to transaction_entries#create" do
        { post: "/transactions" }.should route_to("transaction_entries#create")
      end

      it ":get '/transactions/:id/' should route to transaction_entries#show" do
        { get: "/transactions/#{@id}" }.should route_to("transaction_entries#show", id: "#{@id}")
      end

      it ":get '/transactions/:id/edit' should route to transaction_entries#edit" do
        { get: "/transactions/#{@id}/edit" }.should route_to("transaction_entries#edit", id: "#{@id}")
      end

      it ":put 'transactions/:id' should route to transaction_entries#update" do
        { put: "/transactions/#{@id}" }.should route_to("transaction_entries#update", id: "#{@id}")
      end

      it ":delete 'transactions/:id' should route to transaction_entries#destroy" do
        { delete: "/transactions/#{@id}" }.should route_to("transaction_entries#destroy", id: "#{@id}")
      end
    end

    context "when invalid" do

      context "given a non-integer :id for an otherwise valid route" do

        it ":get '/transactions/one' should not be routable" do
          { get: "/transactions/one" }.should_not be_routable
        end

        it ":get '/transactions/one/edit' should not be routable" do
          { get: "/transactions/one/edit" }.should_not be_routable
        end

        it ":put '/transactions/one' should not be routable" do
          { put: "/transactions/one" }.should_not be_routable
        end

        it ":delete '/transactions/one' should not be routable" do
          { delete: "/transactions/one" }.should_not be_routable
        end
      end
    end
  end
end