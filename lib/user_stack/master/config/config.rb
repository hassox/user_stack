require 'dm-core'
DataMapper.setup(:default, :adapter => "sqlite3", :database => ~"../db/development.db")


UserStack.after_build_stack do
  ::DataMapper.auto_upgrade!
end
