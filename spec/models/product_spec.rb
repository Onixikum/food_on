require 'spec_helper'

describe Product do

  before do
   @product = FactoryGirl.create(:product)
  end

  subject { @product }

  it { should respond_to(:name) }
  it { should respond_to(:price) }
  it { should respond_to(:food_type) }

  it { should be_valid }

  describe "when name is not present" do
    before { @product.name = nil }
    it { should_not be_valid }
  end

  describe "when price is not present" do
    before { @product.price = nil }
    it { should_not be_valid }
  end

  describe "when food type is not present" do
    before { @product.food_type = nil }
    it { should_not be_valid }
  end

  describe "with product name that is too long" do
    before { @product.name = "a" * 26 }
    it { should_not be_valid }
  end
end