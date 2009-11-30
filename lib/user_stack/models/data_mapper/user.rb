module UserStack::DataMapper
  class User
    include DataMapper::Resource

    property :id,         Serial
    property :type,       Discriminator
    property :login,      String
    property :auth_data,  Object

  end
end
