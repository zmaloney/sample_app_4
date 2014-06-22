require 'spec_helper'

describe "UserPages" do

  #define 'page' as the subject of all our tests
  # NB that 'page' is a reserved word, which we get for free. 
  subject { page }
  
  # previously, I was using 'visit/root_path' but that never seemed to work. 
  describe "User pages" do
    before { visit signup_path } # define 'page' as the result of visiting the signup path
    it { should have_selector('h1', text: "Sign up") } #since we defined 'page' as the subject, we can collapse to this syntax.
    it { should have_selector('title', :text => "| Sign up") } 
  end
  
  describe "Profile page" do 
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    it { should have_selector('h1', text: user.name) }
    it { should have_selector('title', text: user.name) }
  end

  describe "signup" do 
    before { visit signup_path }
    let(:submit) { "Create my account" }

    describe "with invalid information" do 
      it "should not create a user" do 
        expect { click_button submit }.not_to change(User, :count)
      end 
    end

    describe "with valid information" do 
      before do 
        fill_in "Name",          with: "Example User"
        fill_in "Email",         with: "user@example.com"
        fill_in "Password",      with: "foobar"
        fill_in "Confirmation",  with: "foobar"
      end
      it "should create a user" do 
        expect { click_button submit }.to change(User, :count).by(1)
      end # of "should create a user"
      
      describe "after saving the user" do 
        before [:all] do 
          click_button submit   
          # NB that we need to install launchy (gem install launchy) before this method works : 
          # save_and_open_page
        end
        let(:user) { User.find_by_email('user@example.com') }
        it { should have_selector('title', text: user.name) }
        it { should have_link('Sign out') }
      end # of "after saving the user"
      
    end # of "with valid information"

  end #of "signup"

end