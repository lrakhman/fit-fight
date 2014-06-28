require 'date'

class User < ActiveRecord::Base

	# validates :email, uniqueness: true, :format => /.+@.+\..+/
	has_many :challenges
	has_many :daily_workouts
	has_many :authorizations

	def client
		Fitgem::Client.new(
			consumer_key: "2f490eb8444c48c1a3e5a3aa738c5018",
			consumer_secret: "01c8682329934edba0f407d27d0494d8",
			token: oauth_token,
			secret: oauth_secret
		)
	end

	def most_recent_workout
		daily_workouts.order(date: :desc).first
	end

	def total_steps
		steps_array = self.daily_workouts.map {|workout| workout.steps}
		steps_array.inject(:+)
	end

	def most_recent_workout
		daily_workouts.order(date: :desc).first
	end

	def total_distance
		distance_array = self.daily_workouts.map {|workout| workout.distance}
		distance_array.inject(:+)
	end

	def total_active_time
		active_time_array = self.daily_workouts.map {|workout| workout.active_time}
		active_time_array.inject(:+)
	end

	def sync
		4.times do |days_ago|
			day = (Date.today - days_ago).to_s
			fitbit_data = client.activities_on_date(day)
			daily_workout = self.daily_workouts.find_or_create_by(date: day)
			daily_workout.update(steps: fitbit_data['summary']['steps'], distance: fitbit_data['summary']['distances'][0]['distance'], active_time: fitbit_data['summary']['veryActiveMinutes'])
		end
	end

end
