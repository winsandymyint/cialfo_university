class Student < ActiveRecord::Base
	belongs_to :mentor
	has_many :student_colleges, :dependent => :destroy
	has_many :colleges, :through=> :student_colleges
end
