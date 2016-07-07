require 'spec_helper'

describe Company do

  before do
   @company = FactoryGirl.create(:company)
  end

  subject { @company }

  it { should respond_to(:name) }
  
  it { should be_valid }

  describe "when name is not present" do
    before { @company.name = nil }
    it { should_not be_valid }
  end
end