class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :title
      t.string :work_experience
      t.text  :bio
      t.string :photo, null: false

      t.timestamps
    end
    add_index :teachers, :name, unique: true
  end
end
