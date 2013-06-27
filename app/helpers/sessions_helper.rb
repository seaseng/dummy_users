helpers do 
  def current_user
    return nil unless session[:user]
    @user ||= User.find_by_id(session[:user])
  end

  def logout!
    session[:user] = nil
  end

  def login!(email, password)
    user = User.authenticate(email, password)
    if user
      session[:user] = user.id
      user
    else
      false
    end
  end

  
end
