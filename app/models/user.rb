class User < ActiveRecord::Base
	# validates :email, uniqueness: true, :format => /.+@.+\..+/
	has_many :challenges
	has_many :daily_workouts
	has_many :authorizations
end
