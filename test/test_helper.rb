ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'

class ActiveSupport::TestCase
  # clear out Mongo collections before tests
  def setup
    Dir[Rails.root.to_s + '/app/models/**/*.rb'].each do |model_path|
      model_name = File.basename(model_path).gsub(/\.rb$/, '')
      klass = model_name.classify.constantize
      klass.collection.remove
    end
  end

  # custom matchers
  custom_matcher :have_error_on do |receiver, matcher, args|
    attribute = args[0]
    receiver.save
    receiver.valid?
    receiver.errors.on(attribute) != nil
  end

end
