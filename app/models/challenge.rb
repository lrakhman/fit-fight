class Challenge < ActiveRecord::Base
	belongs_to :user
	has_one :winner, class_name: "User"
	belongs_to :challenger, class_name: "User"
	has_many :user_workouts, through: :user, source: :daily_workouts
	has_many :challenger_workouts, through: :challenger, source: :daily_workouts

	def user_workouts
    super.where(date: (start_date..end_date))
	end

	def challenger_workouts
		super.where(date: (start_date..end_date))
	end

	def user_points(this_user)
		user_points = 0
		this_user.daily_workouts.each do |workout|
			other_user = [user, challenger].reject { |u| u == this_user }.first
			challenger_workout = other_user.daily_workouts.where(date: workout.date).first
			if challenger_workout
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
		end	
		user_points
	end

	def total_points
		self.user_workouts.count * 3
	end

	def user_step_array
		self.user_workouts.map {|workout| workout.steps}
	end

	def user_total_steps
		user_step_array.inject(:+)
	end

	def challenger_step_array
		self.challenger_workouts.map {|workout| workout.steps}
	end

	def challenger_total_steps
		challenger_step_array.inject(:+)
	end

	def user_distance_array
		self.user_workouts.map {|workout| workout.distance}
	end

	def user_total_distance
		user_distance_array.inject(:+)
	end

	def challenger_distance_array
		self.challenger_workouts.map {|workout| workout.distance}
	end

	def challenger_total_distance
		challenger_distance_array.inject(:+)
	end

	def user_active_time_array
		self.user_workouts.map {|workout| workout.active_time}
	end

	def user_total_active_time
		user_active_time_array.inject(:+)
	end

	def challenger_active_time_array
		self.challenger_workouts.map {|workout| workout.active_time}
	end

	def challenger_total_active_time
		challenger_active_time_array.inject(:+)
	end

end
