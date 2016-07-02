require 'spec_helper'

describe "Order pages" do

  subject { page }

  describe "index" do
    let(:admin) { FactoryGirl.create(:admin) }
    before(:each) do
      sign_in admin
      visit orders_path
    end

    it { should have_title('| List order') }
    it { should have_selector('h3', text: "Today's order") }
    it { should have_selector('h4', text: 'Total price:') }
    it { should have_selector('th', text: 'Email') }
    it { should have_selector('th', text: 'Address') }
    it { should have_selector('th', text: 'Price') }
  end
end