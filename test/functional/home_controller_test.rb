require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  context "on GET to :index" do
    setup do
      sign_in_as :user => Factory(:user)
      mock_warden_for :user
      get :index
    end

    should_respond_with :success
    should_render_template :index
    should_not_set_the_flash
  end
end
