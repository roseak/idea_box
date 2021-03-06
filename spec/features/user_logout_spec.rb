require 'rails_helper'

feature 'User logs out' do
  scenario 'with valid attributes' do
    user = User.create(name: 'rose', password: 'secret', email: 'rose@gmail.com')

    visit login_path
    fill_in 'session[name]', with: 'rose'
    fill_in 'session[password]', with: 'secret'

    within('.container') do
      click_on 'Login'
    end

    expect(page).to have_content('Rose')
    expect(current_path).to eq('/users/2')

    click_on 'Logout'

    expect(current_path).to eq ('/login')
    expect(page).to_not have_content('Rose')
  end
end
