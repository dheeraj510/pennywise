require 'spec_helper'

describe TransactionEntry do

  it { should belong_to(:item) }

  describe "attributes" do

    it { should respond_to(:item_id) }
    it { should respond_to(:type) }
    it { should respond_to(:check_number) }
    it { should respond_to(:memo) }
    it { should respond_to(:cleared) }
    it { should respond_to(:transacted_at) }
    it { should respond_to(:cleared_at) }
    it { should allow_mass_assignment_of(:item_id) }
    it { should allow_mass_assignment_of(:type) }
    it { should allow_mass_assignment_of(:check_number) }
    it { should allow_mass_assignment_of(:memo) }
    it { should allow_mass_assignment_of(:transacted_at) }
    it { should_not allow_mass_assignment_of(:cleared) }
    it { should_not allow_mass_assignment_of(:cleared_at) }
  end

  describe "validations" do
  end

  describe "methods" do
  end
end
