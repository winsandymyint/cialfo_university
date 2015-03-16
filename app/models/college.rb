class College < ActiveRecord::Base
	validates :name, presence: true
	validates :sat_min_score, presence: true
	validates :sat_max_score, presence: true
	validates :tuition_fees, presence: true
	
	has_many :student_colleges
	has_many :students, :through => :student_colleges
end
