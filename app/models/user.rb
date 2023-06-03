class User < ApplicationRecord
  validates :name, persence: true, length: { maxmum: 30 }
  validates :email, presence: true, length: { maxmum: 255 }
  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end

