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
    @user = User.find(session[:user_id])
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

  def sync_fitbit
    @user = User.find(session[:user_id])

    day = Date.today
    fitbit_data = @user.client.activities_on_date(day)
    @daily_workout = @user.daily_workouts.find_or_create_by(date: day)
    @daily_workout.update(steps: fitbit_data['summary']['steps'], distance: fitbit_data['summary']['distances'][0]['distance'], active_time: fitbit_data['summary']['veryActiveMinutes'])
    @steps = @user.total_steps
    @distance = @user.total_distance
    @active_time = @user.total_active_time

    @workout = {steps: @steps, distance: @distance, active_time: @active_time, new_tally: @daily_workout}
    respond_to do |format|
      format.html
      format.json { render json: @workout.to_json }
    end
  end

  private

  def user_params
    params.require(:user).permit(:fullname, :email)
  end

end
