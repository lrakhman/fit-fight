class User < ActiveRecord::Base
	validates :email, uniqueness: true, :format => /.+@.+\..+/
	validates :password, presence: true

	has_secure_password

	has_many :challenges
	has_many :daily_workouts

	def get_most_recent_steps
		self.daily_workouts.first.steps
	end

	def get_most_recent_distance
		self.daily_workouts.first.distance
	end

	def get_most_recent_active_time
		self.daily_workouts.first.active_time
	end

	def get_total_steps
		steps_array = self.daily_workouts.map {|workout| workout.steps}
		steps_array.inject(:+)
	end

	def get_total_distance
		distance_array = self.daily_workouts.map {|workout| workout.distance}
		distance_array.inject(:+)
	end

	def get_total_active_time
		active_time_array = self.daily_workouts.map {|workout| workout.active_time}
		active_time_array.inject(:+)
	end
end
