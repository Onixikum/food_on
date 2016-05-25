require 'spec_helper'

describe "Static Pages" do

	let(:base_title) { "FoodON" }

  describe "Home page" do

    it "should have the content 'Menu of the day' " do
      visit '/static_pages/home'
      expect(page).to have_content('Menu of the day')
    end

    it "should have the title 'Home' " do
    	visit '/static_pages/home'
    	expect(page).to have_title("#{base_title}")
    end
  end

  describe "Help page" do

  	it "should have the content 'Help info' " do
  		visit '/static_pages/help'
  		expect(page).to have_content('Help info')
  	end

  	it "should have the title 'Help' " do
  		visit '/static_pages/help'
  		expect(page).to have_title("#{base_title} | Help")
  	end
  end
  
end
