ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'

class ActiveSupport::TestCase
  # clear out Mongo collections before tests
  def setup
    Dir[Rails.root + 'app/models/**/*.rb'].each do |model_path|
      model_name = File.basename(model_path).gsub(/\.rb$/, '')
      klass = model_name.classify.constantize
      klass.collection.remove
    end
  end

end
