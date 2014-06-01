require 'spec_helper'

describe "StaticPages" do
  
  #define 'page' as the subject of all our tests
  subject { page }
  
  # previously, I was using 'visit/root_path' but that never seemed to work. 
  describe "Home page" do
    before { visit '/' } #this is a nice shortcut ... it defines 'page' as the result of "visit '/'"
    it { should have_selector('h1', text: "Home") } #since we defined 'page' as the subject, we can collapse to this syntax.
    it { should have_selector('title', :text => "| Home") } 
  end
  
  describe "Help page" do 
    before { visit help_path } #NB that we could also have done this with "before { visit '/help'}"
    it { should have_selector('h1', :text => "Help") }
    it { page.should have_content("link") }
    it { page.should have_selector('title', :text => "| Help") }
  end 
  
  describe "About page" do 
    before { visit about_path }
    it "should have the h1 content 'About'" do 
      page.should have_selector('h1', :text => "About")
    end
    it "should have the right title" do 
      page.should have_selector('title', 
        :text => "| About")
    end
  end

  describe "Contact page" do 
    before { visit contact_path }
    it "should have h1 content 'Contact'" do 
      page.should have_selector('h1', :text => "Contact")
    end
    it "should have the right title" do 
      page.should have_selector('title', :text => "| Contact")
    end
  end
  
end
