require 'spec_helper'

describe TransactionEntriesController do
  render_views

  before(:each) do
    @item = FactoryGirl.create(:item)
    @transaction_entry = FactoryGirl.create(:transaction_entry, item: @item)
    @attrs = FactoryGirl.attributes_for(:transaction_entry)
  end

  describe "GET 'index'" do

    before(:each) do
      get :index, item_id: @item.id
    end

    it "should be successful" do
      response.should be_success
    end

    it "should assign @item" do
      assigns(:item).should be_an(Item)
      assigns(:item).id.should eq @item.id
    end

    it "should assign @transactions" do
      assigns(:transactions).should be_an(Array)
      assigns(:transactions).should_not be_empty
      assigns(:transactions).sample.should be_a(TransactionEntry)
      assigns(:transactions).sample.item_id.should eq @item.id
    end

    it "should assign @balance" do
      assigns(:balance).should eq @item.transaction_entries.map(&:amount).sum
    end

    it "should render 'index' template" do
      response.should render_template("transaction_entries/index")
    end
  end

  describe "GET 'new'" do

    before(:each) do
      get :new, item_id: @item.id
    end

    it "should be successful" do
      response.should be_success
    end

    it "should assign @item" do
      assigns(:item).should be_an(Item)
      assigns(:item).id.should eq @item.id
    end

    it "should assign @transaction" do
      assigns(:transaction).should be_a(TransactionEntry)
      assigns(:transaction).item_id.should eq @item.id
    end

    it "should render 'new' template" do
      response.should render_template("transaction_entries/new")
    end
  end

  describe "POST 'create'" do

    before(:each) do
      post :create, item_id: @item.id, transaction_entry: @attrs
    end

    it "should be successful and redirect (301)" do
      response.status.should be(301)
    end

    it "should assign @item" do
      assigns(:item).should be_an(Item)
      assigns(:item).id.should eq @item.id
    end

    it "should assign @transaction" do
      assigns(:transaction).should be_a(TransactionEntry)
      assigns(:transaction).item_id.should eq @item.id
    end

    it "should redirect to 'transaction_entries/show'" do
      response.should redirect_to item_transactions_path
    end
  end

  describe "GET 'show'" do

    before(:each) do
      get :show, item_id: @item.id, id: @transaction_entry.id
    end

    it "should be successful" do
      response.should be_success
    end

    it "should assign @item" do
      assigns(:item).should be_an(Item)
      assigns(:item).id.should eq @item.id
    end

    it "should assign @transaction" do
      assigns(:transaction).should be_a(TransactionEntry)
      assigns(:transaction).item_id.should eq @item.id
    end

    it "should render 'show' template" do
      response.should render_template("transaction_entries/show")
    end
  end

  describe "GET 'edit'" do

    before(:each) do
      get :edit, item_id: @item.id, id: @transaction_entry.id
    end

    it "should be successful" do
      response.should be_success
    end

    it "should assign @item" do
      assigns(:item).should be_an(Item)
      assigns(:item).id.should eq @item.id
    end

    it "should assign @transaction" do
      assigns(:transaction).should be_a(TransactionEntry)
      assigns(:transaction).item_id.should eq @item.id
    end

    it "should render 'edit' template" do
      response.should render_template("transaction_entries/edit")
    end
  end

  describe "PUT 'update'" do

    before(:each) do
      @updated_attrs = { check_number: SecureRandom.random_number(1e4.to_i) }
      put :update, item_id: @item.id, id: @transaction_entry.id, transaction_entry: @updated_attrs
    end

    it "should be successful and redirect (301)" do
      response.status.should be(301)
    end

    it "should assign @item" do
      assigns(:item).should be_an(Item)
      assigns(:item).id.should eq @item.id
    end

    it "should assign @transaction" do
      assigns(:transaction).should be_a(TransactionEntry)
      assigns(:transaction).item_id.should eq @item.id
      assigns(:transaction).check_number.should eq @updated_attrs[:check_number]
    end

    it "should redirect to 'transaction_entries/show'" do
      response.should redirect_to item_transactions_path
    end
  end

  describe "DELETE 'destroy'" do

    before(:each) do
      delete :destroy, item_id: @item.id, id: @transaction_entry.id
    end

    it "should be successful and redirect (301)" do
      response.status.should be(301)
    end

    it "should assign @item" do
      assigns(:item).should be_an(Item)
      assigns(:item).id.should eq @item.id
    end

    it "should redirect to 'transaction_entries/index'" do
      response.should redirect_to item_transactions_path
    end
  end
end