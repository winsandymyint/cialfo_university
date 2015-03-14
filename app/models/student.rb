class Student < ActiveRecord::Base
	belongs_to :mentor
	has_many :colleges, :through=> :student_college
end
