class User < ActiveRecord::Base
	# validates :email, uniqueness: true, :format => /.+@.+\..+/
	has_many :challenges
	has_many :daily_workouts

	has_many :authorizations


	def total_steps
		steps_array = self.daily_workouts.map {|workout| workout.steps}
		steps_array.inject(:+)
	end

	def total_distance
		distance_array = self.daily_workouts.map {|workout| workout.distance}
		distance_array.inject(:+)
	end

	def total_active_time
		active_time_array = self.daily_workouts.map {|workout| workout.active_time}
		active_time_array.inject(:+)
	end

end
