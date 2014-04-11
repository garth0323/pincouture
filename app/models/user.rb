class User < ActiveRecord::Base
	has_many :pins
	has_many :posts
	has_many :hangs
	has_many :posts, :through => :categorizations

	has_secure_password validations: false
end
