class UsersController < ApplicationController
before_filter :skip_password_attribute, only: :update
	  include SessionsHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_challenges_path(@user)
    else
      render :new
    end
  end

  def show
    @user = current_user #session[:user_id]
  end

  def edit
		@post = User.find(params[:id])
	end

  def update
		@user = User.find(params[:id])
  	@user.update(user_params)

  	flash.notice = "Account Updated!"

  	redirect_to user_path(@user)
	end



  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def skip_password_attribute
    if params[:password].blank?
      params.except!(:password)
    end
  end

end
