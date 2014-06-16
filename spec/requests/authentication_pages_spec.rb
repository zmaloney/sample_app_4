require 'spec_helper'

describe "AuthenticationPages" do
  
  subject { page }
  
  describe "signin" do 
    before { visit signin_path }
    
    #invalid or no information should show us "sign in" and an error alert.
    describe "with invalid information" do
      before { click_button "Sign in" } #submit with no info
      it { should have_selector('title',  text: 'Sign in') }
    
      #and ... does invalid info render an error message?
      # We should see a div with classes "alert" and "alert-error"
      it { should have_selector('div.alert.alert-error', text: 'Invalid') } 
    end
    
    # How about a success?
    describe "with valid information" do 
      let(:user) { FactoryGirl.create(:user) }
      before do 
        fill_in "Email",      with: user.email
        fill_in "Password",   with: user.password
        click_button "Sign in"
      end
      
      #now, since it was successful, we should have a bunch of info. 
      # ... a title with the user name in it
      it { should have_selector('title', text: user.name) }
      # ... a link to the user profile page
      it { should have_link('Profile', href: user_path(user)) } 
      # ... a link to sign out
      it { should have_link('Sign out', href: signout_path) }
      # ... and we should no longer show the 'sign in' link
      it { should_not have_link('Sign in', href: signin_path) } 
    end 
  end
  
end
