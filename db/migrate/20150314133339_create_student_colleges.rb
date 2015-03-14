class CreateStudentColleges < ActiveRecord::Migration
  def change
    create_table :student_colleges do |t|
      t.integer :student_id
      t.integer :college_id

      t.timestamps null: false
    end
  end
end
