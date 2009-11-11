# add Devise methods to MongoMapper::Document
MongoMapper::Document::ClassMethods.__send__ :include, Devise::Models
