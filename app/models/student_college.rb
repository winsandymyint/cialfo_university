class StudentCollege < ActiveRecord::Base
	belong_to :student
	belong_to :college
end
