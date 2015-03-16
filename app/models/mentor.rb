class Mentor < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	has_many :students
end
