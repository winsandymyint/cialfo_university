class ChangeDobToDate < ActiveRecord::Migration
  def change
  	change_column :students, :dob,  :date
  end
end
