class User < ApplicationRecord
has_one_attached :avatar
has_secure_password
has_many :follows
has_many :followed_companies , through: :follows , source: :companies
validates :email , presence: true , uniqueness: {case_insensitive: false}
validates :password , presence: true
end
