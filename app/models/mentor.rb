class Mentor < ActiveRecord::Base
	validates :name, presence: true
	validates :age, numericality: true
	validates :bio, length: { maximum: 500 }

	mount_uploader :image, ImageUploader
	has_many :students
end
