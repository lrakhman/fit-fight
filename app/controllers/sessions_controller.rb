class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    authorization = Authorization.find_by(uid: auth_hash['uid'])

    if authorization.nil?
      user = User.create!(fullname: auth_hash[:info].full_name, oauth_token: auth_hash.credentials.token, oauth_secret: auth_hash.credentials.secret)
      authorization = Authorization.create!(user: user, provider: auth_hash[:provider], uid: auth_hash[:uid])
    end

    session[:user_id] = authorization.user_id
    redirect_to user_challenges_path(authorization.user)




    # auth_hash = request.env['omniauth.auth']

    # @authorization = Authorization.find_by_provider_and_uid(auth_hash['provider'], auth_hash['uid'])
    # if @authorization 
    #   render :text => "Welcome #{@authorization.user.fullname}!  You have already signed up"
    # else

      # user = User.new(oauth_token: params[:oauth_token], oauth_secret: params[:oauth_verifier])
      # user.authorization.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
      # user.save





    # render :text => "Hello #{user.fullname}!  Thank you for signing up."


    # end

    # @user = User.find_by_email(params[:email])
    # if @user
    #   if @user.authenticate(params[:password])
    #     session[:user_id] = @user.id
        
        # redirect_to user_challenges_path(@user)
    #   end
    # else
    #   @errors = "Your email or password is incorrect."
    #   render :new
    # end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end