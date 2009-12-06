class UserStack::Controller
  publish
  def user_signup
    v.user = Veneer(stack_class::User).new
    render :new
  end

  publish
  def user_show
    v.user = Veneer(stack_class::User).first(:conditions => {:login => params.login})
    raise Pancake::Errors::NotFound, "User Not Found" unless v.user
    url(:user, :login => v.user.login)
    render :show
  end

  publish
  def user_create
    v.user = Veneer(stack_class::User).new(params.user)
    if v.user.save
      redirect url(:user, :login => v.user.login)
    else
      render :new
    end
  end
end

