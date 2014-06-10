FactoryGirl.define do 
	factory :user do 
		name 					"Test-specific user"
		email 					"test-specific@user.com" 
		password 				"thispasswordpassestests"
		password_confirmation 	"thispasswordpassestests"
	end
end
	