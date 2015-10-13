require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  	test "layout links" do
	  get root_path
	  assert_template 'welcome/index'
	  assert_select "a.btn", "Register now!"
	  assert_select "a[href=?]", root_path, count: 2
	  assert_select "a[href=?]", welcome_about_path
	  assert_select "a[href=?]", welcome_contact_path
	end

	test "new user html" do
		get new_user_path
		assert_template 'users/new'
		assert_select "h1", "New User"
		assert_select "input#user_name", placeholder: "Name"
		assert_select "input#user_email", placeholder: "Email"
		assert_select "input.btn", value: "Create user"
	end

end
