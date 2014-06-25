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
end