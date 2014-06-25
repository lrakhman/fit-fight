feature 'Enter Workout' do

  let! (:user) { User.create(email: 'pdebelak@example.com', password: '123456', fullname: 'Peter Debelak') }

  scenario 'creates a new workout' do
    visit '/'
    within('form') do
      fill_in 'email', with: 'pdebelak@example.com'
      fill_in 'password', with: '123456'
    end
    click_on 'Login'
    within('form') do
      fill_in 'date', with: '06/25/2015'
    end
    expect{ click_on 'Enter a Workout' }.to change{ user.daily_workouts.count }.by(1)
  end

  scenario 'updates a workout' do
    visit '/'
    within('form') do
      fill_in 'email', with: 'pdebelak@example.com'
      fill_in 'password', with: '123456'
    end
    click_on 'Login'
    within('form') do
      fill_in 'date', with: '06/25/2015'
    end
    click_on 'Enter a Workout'
    within('form') do
      fill_in 'daily_workout[step]', with: '2000'
      fill_in 'daily_workout[distance]', with: '3.5'
      fill_in 'daily_workout[active_time]', with: '30'
    end
    expect{ click_on 'Workout!' }.to change{ user.daily_workouts.count }.by(0)
    expect(current_url).to eq user_url(user)
  end
end