require 'mongo_mapper'
require 'veneer/adapters/mongomapper'

module UserStack::MongoMapper
  class User
    include MongoMapper::Document
    include UserStack::AuthType::Password

    key :_type,      String
    key :login,      String
    key :auth_data,  Hash
  end
end

