require 'rails_helper'

feature 'User creates a new account' do
  scenario 'with valid attributes' do
    visit root_path
    expect(current_path).to eq('/')

    click_on 'Sign up'
    expect(current_path).to eq('/users/new')

    fill_in 'user[name]', with: 'rose'
    fill_in 'user[password]', with: 'secret'
    fill_in 'user[email]', with: 'rose@gmail.com'
    click_on 'Sign up'

    expect(current_path).to eq('/users/1')
    within('.profile') do
      expect(page).to have_content('rose')
    end

    within('.navbar') do
      expect(page).to have_content('IdeaBox')
      expect(page).to have_content('Rose')
    end
  end
end
