module ChallengesHelper
	

	def point_assignment
		challenge.user_workouts.each do |workout| 
			user_steps << workout.steps 
			user_distance << workout.distance
			user_active_time << workout.active_time
		end

		challenge.challenger_workouts.each do |workout|
			challenger_steps << workout.steps 
			challenger_distance << workout.distance
			challenger_active_time << workout.active_time
		end
	end



end


