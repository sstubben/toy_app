require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @user_without_email = users(:three)
    @user_without_name = users(:four)
    @user_wrong_email = users(:five)
    @micropost = microposts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
    assert_select "title", "ToyApp | Users"
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { email: @user.email, name: @user.name }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should not save user without email" do
    assert_not @user_without_email.save
  end

  test "should not save user without name" do
    assert_not @user_without_name.save
  end

=begin  

  test "should not save user with incorrect email" do
    assert_not @user_wrong_email.save
  end

=end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { email: @user.email, name: @user.name }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
