require 'spec_helper'

describe "Static Pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)    { 'FoodON' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title('| Home') }
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading)    { 'Help Info' }
    let(:page_title) { 'Help' }

    it_should_behave_like "all static pages"
  end

  it "shoud have the right links on the layout" do
    visit root_path
    first('.container').click_link "Help"
    expect(page).to have_title(full_title('Help'))
    first('.container').click_link "Home"
    click_link "Sign up now!"
    expect(page).to have_title(full_title('Sign Up'))
    first('.container').click_link "FoodON"
    expect(page).to have_title(full_title(''))
    first('.footer').click_link "FoodON"
    expect(page).to have_title(full_title(''))
    first('.footer').click_link "Help"
    expect(page).to have_title(full_title('Help'))
    first('.footer').click_link "Home"
    expect(page).to have_title(full_title(''))
  end
  
end
