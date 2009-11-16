require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should "validate presence of email" do
    user = User.new
    user.save
    user.errors.on(:email).should_not == nil
    user.email = 'john@doe.com'
    user.save
    user.errors.on(:email).should == nil
  end

  should "validate format of email" do
    user = User.new
    user.email = 'jonathan@doe'
    user.save
    user.errors.on(:email).should_not == nil
    user.email = 'john@doe.com'
    user.save
    user.errors.on(:email).should == nil
  end

  context "Creating a user" do
    setup do
      @user = Factory(:user)
    end
    should_change("the number of users", :by => 1) { User.count }
  end
end
