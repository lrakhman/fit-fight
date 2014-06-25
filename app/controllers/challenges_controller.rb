class ChallengesController < ApplicationController
  def index
    @user = User.find_by(session[:user_id])
    @challenge =Challenge.where(session[:user_id])
  end
end