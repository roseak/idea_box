class User < ActiveRecord::Base
  has_secure_password

  validates :name, :email, presence: true, uniqueness: true

  enum role: %w(default admin)
end
