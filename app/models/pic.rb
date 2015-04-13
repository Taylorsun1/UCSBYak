class Pic < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, :styles => { :medium => "1600x1600>", :thumb => "1600x1600>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
