require 'spec_helper'

feature 'Login In' do

  let! (:user) { User.create(email: 'pdebelak@example.com', password: '123456', fullname: 'Peter Debelak') }

  context 'with valid credentials' do
    xscenario 'signs me in' do
      # Given I'm on the login page
      visit '/'
      # And I have filled in the form with valid credentials
      within('form') do
        fill_in 'email', with: 'pdebelak@example.com'
        fill_in 'password', with: '123456'
      end
      # When I click the login button
      click_on 'Login'
      # Then I should be on a page that says welcome back
      expect(current_url).to eq(user_challenges_url(user))
    end
  end

  context "with invalid credentials" do
    xscenario "does not sign me in" do
       # Given I'm on the login page
      visit '/'
      # And I have filled in the form with valid credentials
      within('form') do
        fill_in 'email', with: 'pdebelak@example.co.uk'
        fill_in 'password', with: '654321'
      end
      click_on 'Login'
      # Then I should be on the login page
      expect(page).to have_text("Your email or password is incorrect.")
    end
  end

end

feature 'Login Out' do

  let! (:user) { User.create(email: 'pdebelak@example.com', password: '123456', fullname: 'Peter Debelak') }

  xscenario 'signs me out' do
    visit '/'
    within('form') do
      fill_in 'email', with: 'pdebelak@example.com'
      fill_in 'password', with: '123456'
    end
    click_on 'Login'
    click_link 'Logout'
    expect(current_path).to eq('/')
    expect(page).not_to have_text("Logout")
  end
end