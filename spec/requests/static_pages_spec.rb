require 'spec_helper'

describe "Static Pages" do

  subject { page }

  describe "Home page" do
    before { visit '/' }

    it { should have_content('FoodON') }
    it { should have_title(full_title('')) }
  end

  describe "Help page" do
    before { visit '/help' }

    it { should have_content('Help Info') }
    it { should have_title(full_title('Help')) }
  end
  
end
