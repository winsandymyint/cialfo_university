class College < ActiveRecord::Base
	has_many :student_colleges
	has_many :students, :through => :student_colleges
end
