class User < ActiveRecord::Base
	validates :email, uniqueness: true, :format => /.+@.+\..+/
	validates :password, presence: true

	has_secure_password

	has_many :challenges
	has_many :daily_workouts
end
