require 'pancake'
require 'dirge'
require 'veneer'
require 'rack/contrib/nested_params'


class UserStack < Pancake::Stacks::Short
  stack(:params).use(Rack::NestedParams)

  add_root(__FILE__, "user_stack")

  configuration do
    default :user_class_string, "UserStack::DataMapper::User"
  end

  # Hook to use before we mount any applications
  # before_mount_applications do
  # end
  module DataMapper
    autoload :User, ~"./user_stack/user_models/data_mapper/user"
  end

  module ActiveRecord
    autoload :User, ~"./user_stack/user_models/active_mapper/user"
  end

  module MongoMapper
    autoload :User, ~"./user_stack/user_models/mongo_mapper/user"
  end

  module AuthType
    autoload :Password, ~"./user_stack/lib/password"
  end

  # Setup a user class that can be overwritten
  def self.user_class=(klass)
    remove_const("User") if defined?(User)
    const_set("User", klass)
  end

  # Access a user class.  by default the UserStack::DataMapper::User is used

  def self.const_missing(const)
    if const == :User
      const_set("User", Object.full_const_get(configuration.user_class_string))
      self::User
    else
      super
    end
  end
end

require ::File.join(Pancake.get_root(__FILE__, "user_stack"), "user_stack")
