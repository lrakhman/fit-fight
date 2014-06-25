feature 'New Challenge' do

  let! (:user) { User.create(email: 'pdebelak@example.com', password: '123456', fullname: 'Peter Debelak') }
  let! (:user2) { User.create(email: 'syim@example.com', password: '123456', fullname: 'Stephen Yim') }

  scenario 'creates a new challenge' do
    visit '/'
    within('form') do
      fill_in 'email', with: 'pdebelak@example.com'
      fill_in 'password', with: '123456'
    end
    click_on 'Login'
    visit "/users/#{user.id}/challenges/new"
    within('form') do
      fill_in 'challenger_email', with: 'syim@example.com'
      fill_in 'start_date', with: '06/25/2014'
      fill_in 'end_date', with: '06/30/2014'
    end
    expect{ click_on 'FIGHT!' }.to change{ user.challenges.count }.by(1)
  end
end