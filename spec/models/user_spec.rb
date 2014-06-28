describe User do
  describe '#most_recent_workout' do
    it 'should return the most recent workout' do
      user = User.create
      workout1 = user.daily_workouts.create(date: '2014-06-28')
      workout2 = user.daily_workouts.create(date: '2014-06-27')
      workout3 = user.daily_workouts.create(date: '2014-06-26')
      expect(user.most_recent_workout).to eq(workout1)
    end

    it 'should return a workout' do
      user = User.create
      user.daily_workouts.create(date: '2014-06-28')
      expect(user.most_recent_workout).to be_a DailyWorkout
    end
  end

  describe '#total_steps' do
    it 'should add all the steps taken' do
      user = User.create
      workout1 = user.daily_workouts.create(date: '2014-06-28', steps: 20)
      workout2 = user.daily_workouts.create(date: '2014-06-27', steps: 10)
      expect(user.total_steps).to eq(30)
    end
  end

  describe '#total_distance' do
    it 'should add the distances' do
      user = User.create
      workout1 = user.daily_workouts.create(date: '2014-06-28', distance: 2.0)
      workout2 = user.daily_workouts.create(date: '2014-06-27', distance: 1.2)
      expect(user.total_distance).to eq(3.2)
    end

    describe '#total_active_time' do
      it 'should add the active time together' do
        user = User.create
        workout1 = user.daily_workouts.create(date: '2014-06-28', active_time: 25)
        workout2 = user.daily_workouts.create(date: '2014-06-27', active_time: 10)
        expect(user.total_active_time).to eq(35)
      end
    end
  end
end