require 'spec_helper'

describe "UserPages" do

  #define 'page' as the subject of all our tests
  subject { page }
  
  # previously, I was using 'visit/root_path' but that never seemed to work. 
  describe "User pages" do
    before { visit '/signup' } #this is a nice shortcut ... it defines 'page' as the result of "visit '/'"
    it { should have_selector('h1', text: "Sign up") } #since we defined 'page' as the subject, we can collapse to this syntax.
    it { should have_selector('title', :text => "| Sign up") } 
  end
  
end
