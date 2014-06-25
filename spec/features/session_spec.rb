require 'spec_helper'

feature 'Login In' do

  before do
    User.create(email: 'pdebelak@example.com', password: '123456', full_name: 'Peter Debelak')
  end

  context 'with valid credentials' do
    scenario 'signs me in' do
      # Given I'm on the login page
      visit '/'
      # And I have filled in the form with valid credentials
      within('#authenticate') do
        fill_in 'Email', with: 'pdebelak@example.com'
        fill_in 'Password', with: '123456'
      end
      # When I click the login button
      click_on 'Login'
      # Then I should be on a page that says welcome back
      expect(page).to have_text('Welcome Back')
    end
  end

  context "with invalid credentials" do
    scenario "does not sign me in" do
       # Given I'm on the login page
      visit '/sessions/new'
      # And I have filled in the form with valid credentials
      within('#authenticate') do
        fill_in 'Email', with: 'pdebelak@example.co.uk'
        fill_in 'Password', with: '654321'
      end
      click_on 'Login'
      # Then I should be on the login page
      expect(page).to have_text("Invalid Credentials")
    end
  end

end