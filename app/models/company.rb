class Company < ApplicationRecord
  has_one_attached :logo
  has_secure_password
  has_many :jobs
  has_many :follows
  has_many :followers, through: :follows, source: :users
  validates :email, presence: true
  validates :password, presence: true ,on: :create
end
