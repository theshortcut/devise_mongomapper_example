require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  context "on GET to :new" do
    setup do
      get :new
    end

    should_respond_with :success
    should_render_template :new
    should_not_set_the_flash
  end

  context "on POST to :create" do
    setup do
      put :create, :user => { :email => 'dude@dude.com', :password => 'testing', :password_confirmation => 'testing' }
    end

    should_redirect_to("root") { root_url }
    should_set_the_flash_to /confirm/i
    should_change("the number of users", :by => 1) { User.count }
  end

  context "on GET to :edit while not signed in" do
    setup do
      get :edit
    end

    should_redirect_to("sign in") { new_user_session_url(:unauthenticated => true) }
  end

  context "on GET to :edit while signed in" do
    setup do
      @user = Factory(:user)
      @user.confirm!
      sign_in @user
      get :edit
    end

    should_respond_with :success
    should_render_template :edit
    should_assign_to :user
  end

  context "on POST to :update" do
    setup do
      @user = Factory(:user)
      @user.confirm!
      sign_in @user
      put :update, :user => { :email => 'new@email.com' }
    end

    should_set_the_flash_to /success/i

    should "update the email" do
      updated_user = User.find_by_id(@user._id)
      updated_user.email.should == 'new@email.com'
    end

  end

  context 'on POST to :update with correct :current_password' do
    setup do
      @user = Factory(:user)
      @user.confirm!
      sign_in @user
      put :update, :user => { :current_password => 'testing', :password => 'newpassword', :password_confirmation => 'newpassword' }
    end

    should 'change password' do
      @user.valid_password?('testing').should be(false)
      @user.valid_password?('newpassword').should be(true)
    end
  end
end
