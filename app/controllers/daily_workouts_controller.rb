class DailyWorkoutsController < ApplicationController
  def new
    user = User.find(session[:user_id])
    daily_workout = user.daily_workouts.find_or_create_by(date: params[:date])
    redirect_to edit_user_daily_workout_path(daily_workout.user, daily_workout)
  end

  def edit
    @daily_workout = DailyWorkout.find(params[:id])
    @user = @daily_workout.user
  end

  def update
    daily_workout = DailyWorkout.find(params[:id])
    daily_workout.update(daily_workout_params)
    redirect_to user_path(daily_workout.user)
  end

  private

  def daily_workout_params
    params.require(:daily_workout).permit(:steps, :distance, :active_time)
  end
end