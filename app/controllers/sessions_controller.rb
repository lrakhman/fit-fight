class SessionsController < ApplicationController
  def new
    @user = User.new
    render layout: false
  end

  def create
    auth_hash = request.env['omniauth.auth']
    authorization = Authorization.find_by(uid: auth_hash['uid'])

    if authorization.nil?
      user = User.create!(fullname: auth_hash[:info].full_name, oauth_token: auth_hash.credentials.token, oauth_secret: auth_hash.credentials.secret)
      authorization = Authorization.create!(user: user, provider: auth_hash[:provider], uid: auth_hash[:uid])
    else
      authorization.user.update(oauth_token: auth_hash.credentials.token, oauth_secret: auth_hash.credentials.secret)
    end

    authorization.user.sync

    session[:user_id] = authorization.user_id

    if authorization.user.email.nil?
      session[:email_error] = "Please add an email address so you can challenge others!"
      redirect_to edit_user_path(authorization.user)
    else
      redirect_to user_challenges_path(authorization.user)
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end
end
