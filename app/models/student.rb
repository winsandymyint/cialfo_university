class Student < ActiveRecord::Base
	belongs_to :mentor
	belongs_to :student_college
end
