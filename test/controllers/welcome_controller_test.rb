require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get Welcome page" do
    get :index
    assert_response :success
    assert_select "title", "ToyApp | Welcome"
  end

  test "should get Contact page" do
  	get :contact
  	assert_response :success
  	assert_select "title", "ToyApp | Contact"
  end

  test "should get About page" do
  	get :about
  	assert_response :success
  	assert_select "title", "ToyApp | About"
  end

end
