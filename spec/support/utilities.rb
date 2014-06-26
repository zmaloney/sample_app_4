# Files in the spec/support directory are automatically included by RSpec, so let's 
# create some helpful methods. 

# a helper method to define a valid signin
def valid_signin(user) 
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

# a helper method so we don't have to define error messages each time we test for them. 
RSpec::Matchers.define :have_error_message do |message| 
  match do 
    page.should have_selector('div.alert.alert-danger', text:message)
  end
end