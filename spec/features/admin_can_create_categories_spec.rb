require 'rails_helper'

feature 'Admin can create categories' do
  scenario 'with valid attributes' do
    admin = User.create(name: 'admin',
                        password: 'password',
                        email: 'admin@gmail.com',
                        role: 1)

    visit login_path
    fill_in 'session[name]', with: 'admin'
    fill_in 'session[password]', with: 'password'
    within('.container') { click_on 'Login' }

    visit new_admin_category_path
    expect(current_path).to eq('/admin/categories/new')

    fill_in 'category[name]', with: 'trip'
    click_on 'Submit'

    expect(current_path).to eq('/admin/categories')
    expect(page).to have_content('trip')
  end
end
