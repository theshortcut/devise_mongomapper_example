class User
  include MongoMapper::Document

  timestamps!

  devise :authenticatable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

end
