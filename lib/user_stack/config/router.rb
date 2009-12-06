UserStack.router do |r|
  r.add("/signup", :_defaults => {:action => "user_signup"}, :request_method => :get ).name(:signup)
  r.add("/:login", :_defaults => {:action => "user_show"},   :request_method => :get ).name(:user)
  r.add("/",       :_defaults => {:action => "user_create"}, :request_method => :post).name(:users)
end
