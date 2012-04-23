require 'spec_helper'

describe ItemsController do
  render_views

  before(:each) do
    @item = FactoryGirl.create(:item)
    @attrs = FactoryGirl.attributes_for(:item)
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

    it "should render 'index' template" do
      response.should render_template("items/index")
    end
  end

  describe "GET 'new'" do

    before(:each) do
      get :new
    end

    it "should be successful" do
      response.should be_success
    end

    it "should assign @item" do
      assigns(:item).should be_an(Item)
    end

    it "should render 'new' template" do
      response.should render_template("items/new")
    end
  end

  describe "POST 'create'" do

    before(:each) do
      post :create, item: @attrs
    end

    it "should be successful and redirect (301)" do
      response.status.should be(301)
    end

    it "should assign @item" do
      assigns(:item).should be_an(Item)
      assigns(:item).name.should eq @attrs[:name]
    end

    it "should redirect to 'items/show'" do
      response.should redirect_to items_path
    end
  end

  describe "GET 'show'" do

    before(:each) do
      get :show, id: @item.id
    end

    it "should be successful" do
      response.should be_success
    end

    it "should assign @item" do
      assigns(:item).should be_an(Item)
      assigns(:item).attributes.should eq @item.attributes
    end

    it "should render 'show' template" do
      response.should render_template("items/show")
    end
  end

  describe "GET 'edit'" do

    before(:each) do
      get :edit, id: @item.id
    end

    it "should be successful" do
      response.should be_success
    end

    it "should assign @item" do
      assigns(:item).should be_an(Item)
      assigns(:item).attributes.should eq @item.attributes
    end

    it "should render 'edit' template" do
      response.should render_template("items/edit")
    end
  end

  describe "PUT 'update'" do

    before(:each) do
      @updated_attrs = @attrs.merge(name: "Katy Reese")
      put :update, id: @item.id, item: @updated_attrs
    end

    it "should be successful and redirect (301)" do
      response.status.should be(301)
    end

    it "should assign @item" do
      assigns(:item).should be_an(Item)
      assigns(:item).name.should eq @updated_attrs[:name]
    end

    it "should redirect to 'items/show'" do
      response.should redirect_to items_path
    end
  end

  describe "DELETE 'destroy'" do

    before(:each) do
      delete :destroy, id: @item.id
    end

    it "should be successful and redirect (301)" do
      response.status.should be(301)
    end

    it "should redirect to 'items/index'" do
      response.should redirect_to items_path
    end
  end
end