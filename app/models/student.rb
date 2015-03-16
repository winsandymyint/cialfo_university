class Student < ActiveRecord::Base
	
	validates :age,:name,presence: true
	validates :age, numericality: true
	# validates :age, numericality: true
	validates :current_school, presence: true
	validates :current_level, presence: true
	validates :sat_score, numericality: true
	validates :country, presence: true
	validates :sat_score, numericality: true
	validates :sat_score, presence: true
	validates :mentor_id, presence: true

	belongs_to :mentor
	has_many :student_colleges, :dependent => :destroy
	has_many :colleges, :through=> :student_colleges
end
