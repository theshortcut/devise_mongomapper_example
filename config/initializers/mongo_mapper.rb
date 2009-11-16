# load db settings
db_config = YAML::load(File.read(RAILS_ROOT + "/config/database.yml"))

# connect to the db
if db_config[Rails.env] && db_config[Rails.env]['adapter'] == 'mongodb'
  mongo = db_config[Rails.env]
  MongoMapper.connection = Mongo::Connection.new(mongo['hostname'])
  MongoMapper.database = mongo['database']
end
