require 'spec_helper'

describe Order do

  before do
   @order = FactoryGirl.create(:order)
  end

  subject { @order }

  it { should respond_to(:dish1_id) }
  it { should respond_to(:dish2_id) }
  it { should respond_to(:dish3_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:address) }
  it { should respond_to(:company_id) }

  it { should be_valid }

  describe "when main course id is not present" do
    before { @order.dish1_id = nil }
    it { should_not be_valid }
  end

  describe "when additional food id is not present" do
    before { @order.dish2_id = nil }
    it { should_not be_valid }
  end

  describe "when beverages id is not present" do
    before { @order.dish3_id = nil }
    it { should_not be_valid }
  end

  describe "when user id is not present" do
    before { @order.user_id = nil }
    it { should_not be_valid }
  end

  describe "when address is not present" do
    before { @order.address = nil }
    it { should_not be_valid }
  end

  describe "with product name that is too long" do
    before { @order.address = "a" * 26 }
    it { should_not be_valid }
  end

  describe "when company id is not present" do
    before { @order.company_id = nil }
    it { should_not be_valid }
  end
end