class College < ActiveRecord::Base
	has_many :students, :through => :student_college
end
