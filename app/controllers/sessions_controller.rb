class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_challenges_path(@user)
      end
    else
      @errors = "Your email or password is incorrect."
      render :new
    end
  end
end