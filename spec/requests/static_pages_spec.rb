require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      page.should have_content('Sample App')
    end
  end
  
  describe "Help page" do 
    it "should have the content 'Help page'" do 
      visit '/static_pages/help'
      page.should have_content('Help page')
    end 
    it "should have the content 'link'" do 
      visit '/static_pages/help'
      page.should have_content('link')
    end
  end 
end