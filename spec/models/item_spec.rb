require 'spec_helper'

describe Item do

  it { should have_many(:transaction_entries) }

  describe "attributes" do

    it { should respond_to(:name) }
    it { should respond_to(:type) }
    it { should allow_mass_assignment_of(:name) }
    it { should allow_mass_assignment_of(:type) }
  end

  describe "validations" do
  end

  describe "methods" do
  end
end
