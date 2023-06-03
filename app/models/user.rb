class User < ApplicationRecord
  validates :name, persence: true, length: { maxmum: 30 }
  validates :email, presence: true, length: { maxmum: 255 }
  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, lenth: { minmum: 6 }
end

