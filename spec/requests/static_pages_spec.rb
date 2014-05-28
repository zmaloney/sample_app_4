require 'spec_helper'

describe "StaticPages" do
  
  describe "Home page" do
    it "should have the h1 content 'Home'" do
      visit '/root_path'
      page.should have_selector('h1', :text => "Home")
    end
    it "should have the right title" do 
      visit '/root_path'
      page.should have_selector('title', 
        :text => "| Home")
    end
  end
  
  describe "Help page" do 
    it "should have the h1 content 'Help'" do 
      visit '/help_path'
      page.should have_selector('h1', :text => "Help")
    end 
    it "should have the content 'link'" do 
      visit '/help_path'
      page.should have_content("link")
    end
    it "should have the right title" do 
      visit '/help_path'
      page.should have_selector('title', 
        :text => "| Help")
    end
  end 
  
  describe "About page" do 
    it "should have the h1 content 'About'" do 
      visit '/about_path'
      page.should have_selector('h1', :text => "About")
    end
    it "should have the right title" do 
      visit '/about_path'
      page.should have_selector('title', 
        :text => "| About")
    end
  end

  describe "Contact page" do 
    it "should have h1 content 'Contact'" do 
      visit '/contact_path'
      page.should have_selector('h1', :text => "Contact")
    end
    it "should have the right title" do 
      visit '/contact_path'
      page.should have_selector('title', :text => "| Contact")
    end
  end
  
end
