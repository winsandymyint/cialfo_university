class CreateMentors < ActiveRecord::Migration
  def change
    create_table :mentors do |t|
      t.string :name
      t.integer :age
      t.datetime :dob
      t.string :bio
      t.text :image

      t.timestamps null: false
    end
  end
end
