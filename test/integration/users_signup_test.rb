require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "name is missing; should not sign up" do
  	get new_user_path
  	assert_no_difference "User.count" do
  		post users_path, user: {
  			name: "",
  			email: "test@test.com",
  			password:"123qwe",
  			password_confirmation: "123qwe"
  		}
  	end
  	assert_template 'users/new'
  end
end
