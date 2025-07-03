class User < ApplicationRecord
has_one_attached :avatar
has_secure_password
has_many :follows
has_many :followed_companies , through: :follows , source: :company
validates :email , presence: true 
validates :password , presence: true, on: :create
end
