require 'rails_helper'

RSpec.describe User, type: :model do
  it 'exists' do
    expect(User).to be
  end

  context 'is valid with proper attributes' do
    let(:valid_attributes) do
      { name: 'rose',
        password: 'secret',
        email: 'rose@gmail.com' }
    end
    let(:user) { User.create(valid_attributes) }

    it 'is valid' do
      expect(user).to be_valid
    end

    it 'has a name' do
      expect(user.name).to eq('rose')
    end

    it 'has a password' do
      expect(user.password).to eq('secret')
    end

    it 'has an email' do
      expect(user.email).to eq('rose@gmail.com')
    end
  end

  context 'with invalid attributes' do
    let(:invalid_attributes) do
      { name: nil,
        password: nil,
        email: nil }
    end
    let(:user) { User.create(invalid_attributes)}

    it 'is invalid' do
      expect(user).to_not be_valid
    end
  end
end
