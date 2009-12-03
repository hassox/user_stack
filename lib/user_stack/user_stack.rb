class UserStack
  get "/", :_name => :users do
    render :root
  end

  get "/signup", :_name => :signup do
    "Signup for a new user account"
  end
end

