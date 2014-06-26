class ChallengesController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    
    @challenge = Challenge.where(user_id: session[:user_id])
  end

  def new
    @user = User.find(session[:user_id])
  end

  def show
    @user = User.find(session[:user_id])
    @challenge = Challenge.find(params[:id])
    @current_score = @challenge.user_points(@user)
    @challenger_score = @challenge.total_points - @current_score 
    @challenger = User.find(@challenge.challenger.id)
  end

  def create
    @user = User.find(session[:user_id])
    challenger = User.find_by_email(params[:challenger_email])
    if challenger
      challenge = @user.challenges.create(challenger_id: challenger.id, start_date: params[:start_date], end_date: params[:end_date])
      redirect_to user_challenges_path(@user)
    else
      @errors = "There is no challenger with that email."
      render :new
    end
  end
end