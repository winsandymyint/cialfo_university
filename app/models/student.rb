class Student < ActiveRecord::Base
	belongs_to :mentor
	has_many :students
end
