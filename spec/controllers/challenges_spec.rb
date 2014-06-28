require 'spec_helper'

feature 'New Challenge' do

  let! (:user) { User.create(email: 'pdebelak@example.com', fullname: 'Peter Debelak') }
  let! (:user2) { User.create(email: 'syim@example.com', fullname: 'Stephen Yim') }

  xscenario 'creates a new challenge' do
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

  xscenario 'wont create a challenge if the challenger doesnt exist' do
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

  # background do 
  #   request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:fitbit] 
  # end

  it 'show page is accessible via the index' do
    user = User.create(email: 'mikeepourhadi@gmail.com', fullname: 'Michael Pourhadi') 
    puts "*******************************************************"
    puts user
    page.set_rack_session(:user_id => user.id)
    visit "/users/#{user.id}/challenges"
    expect(page).to have_content("FIT FIGHT")
    
    # , nil, {"omniauth.auth" => OmniAuth.config.mock_auth[:fitbit]})
    
  end

end