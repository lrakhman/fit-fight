feature 'Enter Workout' do

  let! (:user) { User.create(email: 'pdebelak@example.com', password: '123456', fullname: 'Peter Debelak') }

  scenario 'creates a new workout' do
    visit '/'
    within('form') do
      fill_in 'email', with: 'pdebelak@example.com'
      fill_in 'password', with: '123456'
    end
    click_on 'Login'
    visit "/users/#{user.id}/workouts/new"
    within('form') do
      fill_in 'date', with: '06/25/2015'
      fill_in 'steps', with: '2000'
      fill_in 'distance', with: '3.5'
      fill_in 'active_time', with: '30'
    end
    expect{ click_on 'Enter Workout' }.to change{ user.daily_workouts.count }.by(1)
    expect(current_url).to eq user_url(user)
  end
end