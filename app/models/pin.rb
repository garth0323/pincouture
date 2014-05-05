class Pin < ActiveRecord::Base
	belongs_to :user
	belongs_to :celebrity
	has_many :posts
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

	def image_from_url(url)
    self.image = open(url)
  end

  validates :description, presence: :true
end

