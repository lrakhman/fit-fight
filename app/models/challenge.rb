class Challenge < ActiveRecord::Base
	belongs_to :user
	has_one :winner, class_name: "User"
	belongs_to :challenger, class_name: "User"
	has_many :user_workouts, through: :user, source: :daily_workouts
	has_many :challenger_workouts, through: :challenger, source: :daily_workouts

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
