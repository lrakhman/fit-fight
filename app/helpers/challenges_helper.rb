module ChallengesHelper
	def has_challenge_for_current_date?(user)
		user.daily_workouts.first.date == Time.now.strftime("%Y-%m-%d")
	end

	def point_assignment_for_steps
	end

	def point_assignment_for_distance
	end

	def point_assignment_for_active_time
	end


end
