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

end
