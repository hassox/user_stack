require 'pancake'
require 'dirge'
class UserStack < Pancake::Stacks::Short
  add_root(__FILE__, "user_stack")

  # Hook to use before we mount any applications
  # before_mount_applications do
  # end
  module DataMapper
    autoload :User, ~"./user_stack/models/data_mapper/user"
  end

  module ActiveRecord
    autoload :User, ~"./user_stack/models/active_mapper/user"
  end

  # Setup a user class that can be overwritten
  def self.user_class=(klass)
    remove_const("User") if defined?(User)
    const_set("User", klass)
  end

  # Access a user class.  by default the UserStack::DataMapper::User is used
  def self.user_class
    unless defined?(User)
      const_set("User", DataMapper::User)

    end
    User
  end

  # Make sure the user is loaded before the stack is built
  before_build_stack do
    user_class
  end

end

require ::File.join(Pancake.get_root(__FILE__, "user_stack"), "user_stack")
