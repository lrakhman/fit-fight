class Challenge < ActiveRecord::Base
	belongs_to :user
	has_one :winner, class_name: "User"
	has_one :challenger, class_name: "User"
	has_many :user_workouts, through: :user, source: :daily_workouts
	has_many :challenger_workouts, through: :challenger, source: :daily_workouts

	def user_points

	end

	def challenger_points
		
	end

end
