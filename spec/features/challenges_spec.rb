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
    expect(current_url).to eq user_challenges_url(user)
  end

  scenario 'wont create a challenge if the challenger doesnt exist' do
    visit '/'
    within('form') do
      fill_in 'email', with: 'pdebelak@example.com'
      fill_in 'password', with: '123456'
    end
    click_on 'Login'
    visit "/users/#{user.id}/challenges/new"
    within('form') do
      fill_in 'challenger_email', with: 'ysim@example.com'
      fill_in 'start_date', with: '06/25/2014'
      fill_in 'end_date', with: '06/30/2014'
    end
    expect{ click_on 'FIGHT!' }.to change{ user.challenges.count }.by(0)
    expect(current_path).to eq "/users/#{user.id}/challenges"
    expect(page).to have_text 'There is no challenger with that email.'
  end
end

feature 'View Challenge' do

  let! (:user3) { User.create(email: 'pddebelak@example.com', password: '123456', fullname: 'Peter Debelak') }
  let! (:user4) { User.create(email: 'syyim@example.com', password: '123456', fullname: 'Stephen Yim') }
  let! (:challenge) {Challenge.create(user_id: 1, start_date: '2014-06-26', end_date: '2014-06-27', winner_id: nil, challenger_id: 2)}
  let! (:challenge2) {Challenge.create(user_id: 1, start_date: '2014-07-26', end_date: '2014-07-28', winner_id: nil, challenger_id: 2)}
  let! (:session) {session[:user_id] = 1}

  scenario 'show page is accessible via the index' do
    visit "/users/1/challenges" 
    expect(page).to have_content "View Stats"
  end

end