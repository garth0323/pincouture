class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :pin
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

	def image_from_url(url)
    self.image = open(url)
  end
end
