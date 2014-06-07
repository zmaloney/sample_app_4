# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe User do
  #before we do anything else, set up a test user with the attributes we'll be requesting
  before { @user = User.new(name: "Example User", email: "example@foo.com")}
  # and set 'it' to target the user we just created. 
  subject { @user }
  
  #test for existence of name and email attributes. 
  it { should respond_to(:name) } #we could also do this as @user.should respond_to(:name), which is less efficient, obvs.
  it { should respond_to(:email) }
  
  #this should run validation on the user, which -should- be OK at this point. 
  # Basically, just a sanity check -- this is the equivalent of @user.valid? in the console.
  it { should be_valid }
  
  #and set up a failing condition, to make sure it fails correctly. 
  # NB that all these items are basically creating -failing- conditions, which the user.rb 
  # definition should reject as invalid. If the user.rb doesn't reject these, it's a failure. 
  describe "when name is not present" do 
    before { @user.name = "" }
    it { should_not be_valid }
  end 
  
  # so, if user.rb doesn't mandate a max length of 50 as invalid, this test should fail. 
  describe "when name is more than 50 characters" do 
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end
  
  describe "when email is not present" do 
    before { @user.email = "" } 
    it { should_not be_valid }
  end 
  
  describe "when email format is not valid" do 
    it "should be invalid" do 
      addresses = %w[user@foo,com user_at_foo.org example@foo.foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid #should be invalid, since this email is invalid. 
      end
    end
  end
  
  describe "when email format is valid" do 
    it "should be valid" do 
      addresses = %w[user@foo.COM A_US-ER@foo.b.org first.last@foo.co.jp a+b@baz.com]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid #these examples are all OK, so we should get a 'valid' back.
      end
    end
  end
  
  describe "when user email is already taken (non-case-sensitive)" do 
    before do 
      user_with_same_email = @user.dup # duplicate the existing (test) user
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    it { should_not be_valid }
  end
  
end
