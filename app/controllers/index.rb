enable :sessions

get '/' do
  if current_user
    erb :logged_in
  else
    @logged_in = false
    erb :index
  end

end

post '/new_user' do
  if params[:password] == params[:password_confirmation]
    @password_match = true
  else
    @password_match = false
  end
  user = User.create(params)
  if user.valid?
    login!(params[:email], params[:password])
    erb :logged_in
  else
    logout!
    erb :index
  end
end

post '/login' do
  if login!(params[:email], params[:password])
    @logged_in
    erb :logged_in
  else
    logout!
    erb :user_login
  end
end

get '/login' do
  if current_user
    erb :logged_in
  else
    @logged_in = false
    erb :index
  end
end


post '/logout' do
  logout!
  erb :index
end

