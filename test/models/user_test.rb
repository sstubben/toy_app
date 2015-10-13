require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
  	@zero_user = User.new
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")

  end

  test "should be valid" do
  	assert @user.valid?
  end

  test "user should have name and email set" do
  	assert_not @zero_user.valid?
  end

  test "user name should be present" do
  	@user.name = ''
  	assert_not @user.valid?
  end

  test "user email should be present" do
  	@user.email = ''
  	assert_not @user.valid?
  end

  test "user name should not be too long" do
    @user.name = "a"*52
    assert_not @user.valid?
  end

  test "user email should not be too long" do
    @user.email = "a"*244+"@example.com"
    assert_not @user.valid?
  end

  test "user email address should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "user email address should be valid" do
    @user.email = "tester.com"
    assert_not @user.valid?
  end

  test "user password should be present (not blank)" do
    @user.password = @user.password_confirmation= ''*6
    assert_not @user.valid?
  end

  test "user password should have a minimum length" do
    @user.password = @user.password_confirmation = 'a'*5
    assert_not @user.valid?
  end


end
