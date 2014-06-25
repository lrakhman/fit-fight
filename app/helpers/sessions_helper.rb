module SessionsHelper
	def current_user
    return @user ||= User.find(session[:user_id]) if session[:user_id]
    nil
  end
end
