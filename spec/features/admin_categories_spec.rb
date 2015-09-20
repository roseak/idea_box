require 'rails_helper'

feature 'Admin can access the category index' do
  scenario 'with valid attributes' do
    admin = User.create(name: 'admin',
                        password: 'password',
                        email: 'admin@gmail.com',
                        role: 1)

    visit login_path
    expect(current_path).to eq('/login')

    fill_in 'session[name]', with: 'admin'
    fill_in 'session[password]', with: 'password'
    within('.container') do
      click_on 'Login'
    end

    visit admin_categories_path
    expect(page).to have_content('All Categories')
  end
end
