require 'rails_helper'

feature 'User has ideas' do
  xscenario 'with valid attributes' do
    user = User.create(name: 'rose',
                       password: 'password',
                       email: 'rose@gmail.com')
    visit login_path
    fill_in 'session[name]', with: 'rose'
    fill_in 'session[password]', with: 'password'
    within('.container') do
      click_on 'Login'
    end
    expect(current_path).to eq('/users/1')
    click_on 'Create New Idea'

    expect(current_path).to eq('/users/1/new')
    expect(page).to have_content('Description')
    fill_in 'idea[name]', with: 'scuba'
    fill_in 'idea[description]', with: 'diving with sharks in NZ'
    click_on 'Submit'

    expect(current_path).to eq('/users/1')
    expect(page).to have_content('scuba')
  end
end
