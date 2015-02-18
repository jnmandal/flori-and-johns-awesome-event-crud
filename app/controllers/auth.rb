get '/login' do
  @user = User.new
  erb :"auth/login"
end

post '/login' do
  @user = User.authenticate(params[:username], params[:password])
   if @user
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    erb :"auth/login"
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end

get '/signup' do
  @user = User.new
  erb :"auth/signup"
end

post '/signup' do
  @user = User.new(params[:user])
  redirect "/users/#{@user.id}" if @user.save
  erb :"auth/signup"
end
