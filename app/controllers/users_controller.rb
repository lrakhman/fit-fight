class UsersController < ApplicationController

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
		@user = User.find(params[:id])
	end

  def update
		@user = User.find(params[:id])
  	@user.update(user_params)

  	flash.notice = "Account Updated!"

  	redirect_to user_challenges_path(@user)
	end



  private

  def user_params
    params.require(:user).permit(:fullname, :email)
  end

end
