UserStack.router do |r|
  r.add("/signup", :conditions => {:request_method => /get/i}).to(:action => "user_signup").name(:signup)
  r.add("/:login", :conditions => {:request_method => /get/i}).to(:action => "user_show").name(:user)
  r.add("/",       :conditions => {:request_method => /post/i}).to(:action => "user_create").name(:users)
end
