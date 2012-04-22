require 'spec_helper'

describe ItemsController do

  before(:each) do
    @id = SecureRandom.random_number(1e9.to_i)
  end

  describe "routing" do

    context "when valid" do

      it ":get '/items' should route to items#index" do
        { get: "/items" }.should route_to("items#index")
      end

      it ":get '/items/new' should route to items#new" do
        { get: "/items/new" }.should route_to("items#new")
      end

      it ":post '/items' should route to items#create" do
        { post: "/items" }.should route_to("items#create")
      end

      it ":get '/items/:id/' should route to items#show" do
        { get: "/items/#{@id}" }.should route_to("items#show", id: "#{@id}")
      end

      it ":get '/items/:id/edit' should route to items#edit" do
        { get: "/items/#{@id}/edit" }.should route_to("items#edit", id: "#{@id}")
      end

      it ":put 'items/:id' should route to items#update" do
        { put: "/items/#{@id}" }.should route_to("items#update", id: "#{@id}")
      end

      it ":delete 'items/:id' should route to items#destroy" do
        { delete: "/items/#{@id}" }.should route_to("items#destroy", id: "#{@id}")
      end
    end

    context "when invalid" do

      context "given a non-integer :id for an otherwise valid route" do

        it ":get '/items/one' should not be routable" do
          { get: "/items/one" }.should_not be_routable
        end

        it ":get '/items/one/edit' should not be routable" do
          { get: "/items/one/edit" }.should_not be_routable
        end

        it ":put '/items/one' should not be routable" do
          { put: "/items/one" }.should_not be_routable
        end

        it ":delete '/items/one' should not be routable" do
          { delete: "/items/one" }.should_not be_routable
        end
      end
    end
  end
end