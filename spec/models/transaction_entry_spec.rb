require 'spec_helper'

describe TransactionEntry do

  it { should belong_to(:item) }

  describe "attributes" do

    it { should respond_to(:item_id) }
    it { should respond_to(:entry_type) }
    it { should respond_to(:check_number) }
    it { should respond_to(:memo) }
    it { should respond_to(:cleared) }
    it { should respond_to(:transacted_at) }
    it { should respond_to(:cleared_at) }
    it { should respond_to(:amount) }
    it { should allow_mass_assignment_of(:item_id) }
    it { should allow_mass_assignment_of(:entry_type) }
    it { should allow_mass_assignment_of(:check_number) }
    it { should allow_mass_assignment_of(:memo) }
    it { should allow_mass_assignment_of(:transacted_at) }
    it { should allow_mass_assignment_of(:cleared) }
    it { should allow_mass_assignment_of(:cleared_at) }
    it { should allow_mass_assignment_of(:amount) }
  end

  describe "validations" do

    subject{ FactoryGirl.create(:transaction_entry)}

    before(:each) do
      @attrs = FactoryGirl.attributes_for(:transaction_entry)
    end

    it { should validate_presence_of(:item_id) }
    it { should validate_presence_of(:entry_type) }
    it { should validate_presence_of(:transacted_at) }
    it { should validate_presence_of(:amount) }

    it { should validate_numericality_of(:item_id) }
    it { should validate_numericality_of(:check_number) }
    it { should validate_numericality_of(:amount) }

    it { should allow_value('deposit').for(:entry_type) }
    it { should allow_value('autodraft').for(:entry_type) }
    it { should allow_value('atm').for(:entry_type) }
    it { should allow_value('check').for(:entry_type) }
    it { should allow_value('transfer').for(:entry_type) }
    it { should allow_value('checkcard').for(:entry_type) }

    it { should_not allow_value('payment').for(:entry_type) }
    it { should_not allow_value('123').for(:entry_type) }
  end

  describe "methods" do
  end
end
