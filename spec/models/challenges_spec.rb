describe Challenge do
  describe '#user_workouts' do
    it 'ignores workouts outside the date range' do
      user1 = User.create
      user2 = User.create
      challenge = user1.challenges.create(challenger_id: user2.id, start_date: '2014-06-27', end_date: '2014-06-28')
      workout1 = user1.daily_workouts.create(date: '2014-06-26')
      expect(challenge.user_workouts).not_to include workout1
      expect(challenge.user_workouts.count).to eq 0
    end

    it 'includes all workouts inside the date range' do
      user1 = User.create
      user2 = User.create
      challenge = user1.challenges.create(challenger_id: user2.id, start_date: '2014-06-27', end_date: '2014-06-28')
      workout1 = user1.daily_workouts.create(date: '2014-06-27')
      workout2 = user1.daily_workouts.create(date: '2014-06-28')
      expect(challenge.user_workouts).to include workout1
      expect(challenge.user_workouts).to include workout2
      expect(challenge.user_workouts.count).to eq 2
    end
  end
  describe '#challenger_workouts' do
    it 'ignores workouts outside the date range' do
      user1 = User.create
      user2 = User.create
      challenge = user1.challenges.create(challenger_id: user2.id, start_date: '2014-06-27', end_date: '2014-06-28')
      workout1 = user2.daily_workouts.create(date: '2014-06-26')
      expect(challenge.challenger_workouts).not_to include workout1
      expect(challenge.challenger_workouts.count).to eq 0
    end

    it 'includes all workouts inside the date range' do
      user1 = User.create
      user2 = User.create
      challenge = user1.challenges.create(challenger_id: user2.id, start_date: '2014-06-27', end_date: '2014-06-28')
      workout1 = user2.daily_workouts.create(date: '2014-06-27')
      workout2 = user2.daily_workouts.create(date: '2014-06-28')
      expect(challenge.challenger_workouts).to include workout1
      expect(challenge.challenger_workouts).to include workout2
      expect(challenge.challenger_workouts.count).to eq 2
    end
  end
  describe '#user_points' do
    it 'calculates the number of points' do
      user1 = User.create
      user2 = User.create
      challenge = user1.challenges.create(challenger_id: user2.id, start_date: '2014-06-27', end_date: '2014-06-28')
      user1.daily_workouts.create(date: '2014-06-27', steps: 1, distance: 1.0, active_time: 0)
      user2.daily_workouts.create(date: '2014-06-27', steps: 0, distance: 0.0, active_time: 1)
      user1.daily_workouts.create(date: '2014-06-28', steps: 0, distance: 1.0, active_time: 1)
      user2.daily_workouts.create(date: '2014-06-28', steps: 1, distance: 0.0, active_time: 0)
      expect(challenge.user_points).to eq 4
    end
  end
  describe '#total_points' do
    it 'calculates the total points' do
      user1 = User.create
      user2 = User.create
      challenge = user1.challenges.create(challenger_id: user2.id, start_date: '2014-06-27', end_date: '2014-06-28')
      user1.daily_workouts.create(date: '2014-06-27', steps: 1, distance: 1.0, active_time: 0)
      user2.daily_workouts.create(date: '2014-06-27', steps: 0, distance: 0.0, active_time: 1)
      user1.daily_workouts.create(date: '2014-06-28', steps: 0, distance: 1.0, active_time: 1)
      user2.daily_workouts.create(date: '2014-06-28', steps: 1, distance: 0.0, active_time: 0)
      expect(challenge.total_points).to eq 6
    end
  end

  describe '#user_total_steps' do
    it 'adds the users steps' do
      user1 = User.create
      user2 = User.create
      challenge = user1.challenges.create(challenger_id: user2.id, start_date: '2014-06-27', end_date: '2014-06-28')
      user1.daily_workouts.create(date: '2014-06-27', steps: 1, distance: 1.0, active_time: 0)
      user1.daily_workouts.create(date: '2014-06-28', steps: 10, distance: 1.0, active_time: 1)
      expect(challenge.user_total_steps).to eq 11
    end
  end

  describe '#user_total_distance' do
    it 'adds the users distance' do
      user1 = User.create
      user2 = User.create
      challenge = user1.challenges.create(challenger_id: user2.id, start_date: '2014-06-27', end_date: '2014-06-28')
      user1.daily_workouts.create(date: '2014-06-27', steps: 1, distance: 1.0, active_time: 0)
      user1.daily_workouts.create(date: '2014-06-28', steps: 10, distance: 4.1, active_time: 1)
      expect(challenge.user_total_distance).to eq 5.1
    end
  end

  describe '#user_total_active_time' do
    it 'adds the users active time' do
      user1 = User.create
      user2 = User.create
      challenge = user1.challenges.create(challenger_id: user2.id, start_date: '2014-06-27', end_date: '2014-06-28')
      user1.daily_workouts.create(date: '2014-06-27', steps: 1, distance: 1.0, active_time: 20)
      user1.daily_workouts.create(date: '2014-06-28', steps: 10, distance: 4.1, active_time: 1)
      expect(challenge.user_total_active_time).to eq 21
    end
  end

  describe '#challenger_total_steps' do
    it 'adds the challengers steps' do
      user1 = User.create
      user2 = User.create
      challenge = user1.challenges.create(challenger_id: user2.id, start_date: '2014-06-27', end_date: '2014-06-28')
      user2.daily_workouts.create(date: '2014-06-27', steps: 21, distance: 1.0, active_time: 0)
      user2.daily_workouts.create(date: '2014-06-28', steps: 10, distance: 1.0, active_time: 1)
      expect(challenge.challenger_total_steps).to eq 31
    end
  end

  describe '#challenger_total_distance' do
    it 'adds the users distance' do
      user1 = User.create
      user2 = User.create
      challenge = user1.challenges.create(challenger_id: user2.id, start_date: '2014-06-27', end_date: '2014-06-28')
      user2.daily_workouts.create(date: '2014-06-27', steps: 1, distance: 2.0, active_time: 0)
      user2.daily_workouts.create(date: '2014-06-28', steps: 10, distance: 4.7, active_time: 1)
      expect(challenge.challenger_total_distance).to eq 6.7
    end
  end

  describe '#challenger_total_active_time' do
    it 'adds the users active time' do
      user1 = User.create
      user2 = User.create
      challenge = user1.challenges.create(challenger_id: user2.id, start_date: '2014-06-27', end_date: '2014-06-28')
      user2.daily_workouts.create(date: '2014-06-27', steps: 1, distance: 1.0, active_time: 20)
      user2.daily_workouts.create(date: '2014-06-28', steps: 10, distance: 4.1, active_time: 11)
      expect(challenge.challenger_total_active_time).to eq 31
    end
  end
end