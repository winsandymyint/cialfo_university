class ChangeMentorDobToDate < ActiveRecord::Migration
  def change
  	change_column :mentors, :dob,  :date
  end
end
