class DailyWorkout < ActiveRecord::Base
	belongs_to :user


	client = Fitgem::Client.new {
  :consumer_key => my_key,
  :consumer_secret => my_secret,
  :token => user.oauth_token,
  :secret => user.oauth_secret
}
end
