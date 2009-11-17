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
end
