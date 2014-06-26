class Challenge < ActiveRecord::Base
	belongs_to :user
	has_one :winner, class_name: "User"
	belongs_to :challenger, class_name: "User"
	has_many :user_workouts, through: :user, source: :daily_workouts
	has_many :challenger_workouts, through: :challenger, source: :daily_workouts

	def user_points(user)
		user_points = 0
		user.daily_workouts.each do |workout|
			
			challenger_workout = DailyWorkout.find_by_date(workout.date)
			
			if workout.steps > challenger_workout.steps
				user_points += 1
			end
			if workout.distance > challenger_workout.distance
				user_points += 1
			end
			if workout.active_time > challenger_workout.active_time
				user_points += 1
			end
		end	
		user_points
	end

	def total_points
		self.user_workouts.count * 3
	end

	def user_total_steps
		steps_array = self.user_workouts.map {|workout| workout.steps}
		steps_array.inject(:+)
	end

	def challenger_total_steps
		steps_array = self.challenger_workouts.map {|workout| workout.steps}
		steps_array.inject(:+)
	end

	def user_total_distance
		distance_array = self.user_workouts.map {|workout| workout.distance}
		distance_array.inject(:+)
	end

	def challenger_total_distance
		distance_array = self.challenger_workouts.map {|workout| workout.distance}
		distance_array.inject(:+)
	end

	def user_total_active_time
		active_time_array = self.user_workouts.map {|workout| workout.active_time}
		active_time_array.inject(:+)
	end

	def challenger_total_active_time
		active_time_array = self.challenger_workouts.map {|workout| workout.active_time}
		active_time_array.inject(:+)
	end

end
