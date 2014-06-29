class ChallengesController < ApplicationController
  include ChallengesHelper

  def index
    @user = User.find(session[:user_id])
    @challenged_list = Challenge.where(challenger_id: session[:user_id])
    
    if @user.email
      if session[:email_error]
        session[:email_error].clear
      end
    end
    
  end

  def new
    @user = User.find(session[:user_id])
  end

  def show
    @challenge = Challenge.find(params[:id])
    @user = @challenge.user
    @challenger = @challenge.challenger
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