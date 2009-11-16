require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should "validate presence of email" do
    user = User.new
    user.should have_error_on(:email)
    user.email = 'test1@test.com'
    user.should_not have_error_on(:email)
  end

  should "validate format of email" do
    user = User.new
    user.email = 'test2@test'
    user.should have_error_on(:email)
    user.email = 'test2@test.com'
    user.should_not have_error_on(:email)
  end

  should "validate presence of password for new user" do
    user = User.new
    user.should have_error_on(:password)
    user.password = 'testing'
    user.password_confirmation = 'testing'
    user.should_not have_error_on(:password)
  end

  should "validate confirmation of password" do
    user = User.new
    user.password = 'testing'
    user.password_confirmation = 'tasting'
    user.should have_error_on(:password)
    user.password_confirmation = 'testing'
    user.should_not have_error_on(:password)
  end

  should "validate length of password" do
    user = User.new
    user.password = 'hi'
    user.password_confirmation = 'hi'
    user.should have_error_on(:password)
    user.password = 'hi_there'
    user.password_confirmation = 'hi_there'
    user.should_not have_error_on(:password)
  end

  context "Creating a user" do
    setup do
      @user = Factory(:user)
    end
    should_change("the number of users", :by => 1) { User.count }
  end
end
