class User < ActiveRecord::Base
	has_many :pins
	has_many :posts
	has_many :hangs
  has_many :posts, :through => :hangs

	has_secure_password validations: false

	validates :email, presence: :true, uniqueness: :true
	validates :username, presence: :true, uniqueness: :true
	validates :password, presence: :true, on: :create, length: {minimum: 8}
end
