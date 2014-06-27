module ChallengesHelper

	def get_front_runner(challenge)
		user_score = challenge.user_points(challenge.user)
    challenger_score = challenge.total_points - user_score 
		if user_score > challenger_score
			challenge.user
		else
			challenge.challenger
		end
	end

	def get_winner(challenge)
		user_score = challenge.user_points(challenge.user)
    challenger_score = challenge.total_points - user_score 
		if DateTime.now > challenge.end_date
			if user_score > challenger_score
				challenge.user
			else
				challenge.challenger
			end
		else
			nil
		end
	end

end


