module ChallengesHelper
	def has_challenge_for_current_date?(user)
		user.daily_workouts.first.date == Time.now.strftime("%Y-%m-%d")
	end
end
