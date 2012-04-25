require 'spec_helper'

describe HomeController do
  render_views

  before(:each) do
    @item = FactoryGirl.create(:item)
    @transaction_entry = FactoryGirl.create(:transaction_entry, item: @item)
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

    it "should assign @transactions" do
      assigns(:transactions).should be_an(Array)
      assigns(:transactions).should_not be_empty
      assigns(:transactions).sample.should be_a(TransactionEntry)
      assigns(:transactions).sample.item_id.should eq @item.id
    end
  end
end
