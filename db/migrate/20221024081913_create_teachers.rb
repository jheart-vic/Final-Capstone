class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :title
      t.string :photo, null: false, default: "https://img.icons8.com/ios-glyphs/344/person-male.png"

      t.timestamps
    end
    add_index :teachers, :name, unique: true
  end
end
