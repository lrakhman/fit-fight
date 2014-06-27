class User < ActiveRecord::Base
	# validates :email, uniqueness: true, :format => /.+@.+\..+/
	has_many :challenges
	has_many :daily_workouts
	has_one :most_recent_workout, -> { 'ORDER date, desc, limit 1' }

	has_many :authorizations

	# def sync

	# 	make client, call client.activity_on_date for each date that there is no daily workout, create a daily workout for each of those days up to today, find or create by today
	# end

	def self.sing
		puts "Helloooooooo, there!"
	end

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
