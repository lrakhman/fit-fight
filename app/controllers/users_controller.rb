class UsersController < ApplicationController

	  include SessionsHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = current_user #session[:user_id]
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
