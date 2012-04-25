require 'spec_helper'

describe HomeController do
  render_views

  before(:each) do
    @item = FactoryGirl.create(:item)
  end

  describe "GET 'index'" do

    before(:each) do
      get :index
    end

    it "should be successful" do
      response.should be_success
    end

    it "should assign @items" do
      assigns(:items).should be_an(Array)
      assigns(:items).should_not be_empty
      assigns(:items).sample.should be_an(Item)
    end
  end
end
