require 'pancake'
class UserStack < Pancake::Stacks::Short
  add_root(__FILE__, "user_stack")

  # Hook to use before we mount any applications
  # before_mount_applications do
  # end

  initialize_stack
end

require ::File.join(Pancake.get_root(__FILE__, "user_stack"), "user_stack")
