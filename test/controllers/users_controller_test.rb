require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = User.create(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
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
    assert_select "title", "ToyApp | Register User"
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { email: "user@email.com", name: "name", password:"123qwe",password_confirmation:"123qwe" }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should not be valid - without email" do
    @user.email =''
    assert_not @user.save
  end

  test "should not save user without name" do
    @user.name = ''
    assert_not @user.save
  end


  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { email: @user.email, name: @user.name,password:"qwe123",password_confirmation:"qwe123" }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
