require 'spec_helper'

describe TransactionEntriesController do
  render_views

  before(:each) do
    @transaction_entry = FactoryGirl.create(:transaction_entry)
    @attrs = FactoryGirl.attributes_for(:transaction_entry)
  end

  describe "GET 'index'" do

    before(:each) do
      get :index
    end

    it "should be successful" do
      response.should be_success
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

    it "should render 'new' template" do
      response.should render_template("transaction_entries/new")
    end
  end

  describe "POST 'create'" do

    before(:each) do
      post :create, transaction_entry: @attrs
    end

    it "should be successful and redirect (301)" do
      response.status.should be(301)
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

    it "should render 'edit' template" do
      response.should render_template("transaction_entries/edit")
    end
  end

  describe "PUT 'update'" do

    before(:each) do
      put :update, transaction_entry: @attrs.merge(name: "")
    end

    it "should be successful and redirect (301)" do
      response.status.should be(301)
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