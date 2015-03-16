class HomesController < ApplicationController
  def index
  	colleges = College.all
	colleges = College.joins(:students).where("colleges.name Like (?)", "%#{params[:name]}%").uniq if params[:name].present?
    @temp_arr = []
	colleges.each do |college|
		temp_students = []
		college.students.each do |student|
			obj = JSON.parse(student.to_json)
			obj["college"] = college.name
			temp_students << obj
		end
		@temp_arr << temp_students

	end unless colleges.nil?
	@students = @temp_arr.flatten unless colleges.nil?
  end

  def show

  end
end
