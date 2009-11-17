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

  context "on GET to :edit while not signed in" do
    setup do
      get :edit
    end

    should_redirect_to("default") { new_user_session_url(:unauthenticated => true) }
  end

  context "on GET to :edit while signed in" do
    setup do
      @user = Factory(:user)
      sign_in @user
      get :edit
    end

    should_respond_with :success
    should_render_template :edit
  end
end
