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
      get :index
    end

    it "should be successful" do
      response.should be_success
    end

    it "should assign @transactions" do
      assigns(:transactions).should be_an(Array)
      assigns(:transactions).should_not be_empty
      assigns(:transactions).sample.should be_a(TransactionEntry)
    end

    it "should render 'index' template" do
      response.should render_template("transaction_entries/index")
    end
  end

  describe "GET 'new'" do

    before(:each) do
      get :new
    end

    it "should be successful" do
      response.should be_success
    end

    it "should assign @transaction" do
      assigns(:transaction).should be_a(TransactionEntry)
    end

    it "should render 'new' template" do
      response.should render_template("transaction_entries/new")
    end
  end

  describe "POST 'create'" do

    before(:each) do
      post :create, transaction: @attrs
    end

    it "should be successful and redirect (301)" do
      ap assigns(:transaction).errors.full_messages
      response.status.should be(301)
    end

    it "should assign @transaction" do
      assigns(:transaction).should be_a(TransactionEntry)
      assigns(:transaction).item_id.should eq @attrs[:item_id]
    end

    it "should redirect to 'transaction_entries/show'" do
      response.should redirect_to transactions_path
    end
  end

  describe "GET 'show'" do

    before(:each) do
      get :show, id: @transaction_entry.id
    end

    it "should be successful" do
      response.should be_success
    end

    it "should assign @transaction" do
      assigns(:transaction).should be_a(TransactionEntry)
      assigns(:transaction).attributes.should eq @transaction.attributes
    end

    it "should render 'show' template" do
      response.should render_template("transaction_entries/show")
    end
  end

  describe "GET 'edit'" do

    before(:each) do
      get :edit, id: @transaction_entry.id
    end

    it "should be successful" do
      response.should be_success
    end

    it "should assign @transaction" do
      assigns(:transaction).should be_a(TransactionEntry)
      assigns(:transaction).attributes.should eq @transaction.attributes
    end

    it "should render 'edit' template" do
      response.should render_template("transaction_entries/edit")
    end
  end

  describe "PUT 'update'" do

    before(:each) do
      @updated_attrs = @attrs.merge(check_number: SecureRandom.random_number(1e4.to_i))
      put :update, id: @transaction.id, transaction_entry: @updated_attrs
    end

    it "should be successful and redirect (301)" do
      response.status.should be(301)
    end

    it "should assign @transaction" do
      assigns(:transaction).should be_a(TransactionEntry)
      assigns(:transaction).check_number.should eq @updated_attrs[:check_number]
    end

    it "should redirect to 'transaction_entries/show'" do
      response.should redirect_to transactions_path
    end
  end

  describe "DELETE 'destroy'" do

    before(:each) do
      delete :destroy, id: @transaction_entry.id
    end

    it "should be successful and redirect (301)" do
      response.status.should be(301)
    end

    it "should redirect to 'transaction_entries/index'" do
      response.should redirect_to transactions_path
    end
  end
end