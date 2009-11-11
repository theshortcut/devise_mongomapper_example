ActionController::Routing::Routes.draw do |map|
  map.devise_for :users

  map.resources  :home, :only => :index
  map.resource   :user, :only => [:new, :create, :edit, :update]

  map.root       :controller => "home"
end
