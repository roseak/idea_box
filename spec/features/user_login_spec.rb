require 'rails_helper'

feature 'User logs in' do
  xscenario 'with valid attributes' do
    user = User.create(name: 'rose', password: 'secret', email: 'rose@gmail.com')

    visit login_path
    expect(current_path).to eq('/login')

    fill_in 'session[name]', with: 'rose'
    fill_in 'session[password]', with: 'secret'
    click_on 'Login'

    expect(current_path).to eq('/users/1')
    within('.navbar') do
      expect(page).to have_content('Rose')
    end
  end
end
