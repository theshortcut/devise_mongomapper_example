require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  context "on GET to :new" do
    setup do
      sign_in_as :user => Factory(:user)
      mock_warden_for :user
      get :new
    end

    should_respond_with :success
    should_render_template :new
    should_not_set_the_flash
  end
end
