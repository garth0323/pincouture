class Celebrity < ActiveRecord::Base
	has_many :pins

	validates :name, presence: :true, uniqueness: :true
end
