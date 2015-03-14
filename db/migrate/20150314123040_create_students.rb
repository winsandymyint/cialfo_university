class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.integer :age
      t.datetime :dob
      t.string :current_school
      t.string :current_level
      t.string :country
      t.integer :sat_score

      t.timestamps null: false
    end
  end
end
