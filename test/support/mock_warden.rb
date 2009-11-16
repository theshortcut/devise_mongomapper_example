class ActionController::TestCase
  # setup :mock_warden
  teardown :cleanup_warden_env
  
  def warden
    @_warden ||= mock
  end
  
  def mock_warden_for(*scopes)
    scopes.each do |scope|
      warden.stubs(:authenticate!).with(:scope => scope) # before_filter :authenticate_user!
    end
    
    @controller.request.env['warden'] = warden
  end
  
  def mock_warden
    mock_warden_for :user
  end
  
  def sign_in_as(people)
    mock_warden_for *people.keys
    
    people.each_pair do |scope, object|
      warden.stubs(:user).with(scope).returns(object) # current_user
      warden.stubs(:authenticated?).with(scope).returns(!object.nil?) # user_signed_in?
    end
  end
  
  def sign_in
    sign_in_as :user => Factory(:user)
  end
  
  private
    def cleanup_warden_env
      @controller.request.env.delete('warden')
    end
end
