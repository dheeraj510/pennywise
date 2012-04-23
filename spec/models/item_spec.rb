require 'spec_helper'

describe Item do

  it { should have_many(:transaction_entries) }

  describe "attributes" do

    it { should respond_to(:name) }
    it { should respond_to(:item_type) }
    it { should allow_mass_assignment_of(:name) }
    it { should allow_mass_assignment_of(:item_type) }
  end

  describe "validations" do

    subject{ FactoryGirl.create(:item)}

    before(:each) do
      @attrs = FactoryGirl.attributes_for(:item)
    end

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:item_type) }

    it { should allow_value('expense').for(:item_type) }
    it { should allow_value('income').for(:item_type) }

    it { should_not allow_value('payment').for(:item_type) }
    it { should_not allow_value('123').for(:item_type) }

    it { should validate_uniqueness_of(:name).scoped_to(:item_type).
         with_message(/Item already exists/) }
  end

  describe "methods" do
  end
end
