class Pin < ActiveRecord::Base
	belongs_to :user
	belongs_to :celebrity
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" } 
end

