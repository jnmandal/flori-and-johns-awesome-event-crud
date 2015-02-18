helpers do
  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect '/' unless current_user
  end
end

