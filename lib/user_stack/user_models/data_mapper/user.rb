require 'dm-core'
require 'veneer/adapters/datamapper'

module UserStack::DataMapper
  class User
    include ::DataMapper::Resource
    include UserStack::AuthType::Password

    property :id,         Serial
    property :type,       Discriminator
    property :login,      String
    property :auth_data,  Object

  end
end
