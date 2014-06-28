class UsersController < ApplicationController
  respond_to :html, :js
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
    @user = User.find(session[:user_id])
    @user.sync
  end

  def edit
		@user = User.find(params[:id])
	end

  def update
		@user = User.find(params[:id])
  	@user.update(user_params)

  	flash.notice = "Account Updated!"

  	redirect_to user_challenges_path(@user)
	end

  def sync
    @user = User.find(session[:user_id])
    @user.sync
  end

  private

  def user_params
    params.require(:user).permit(:fullname, :email)
  end

end
