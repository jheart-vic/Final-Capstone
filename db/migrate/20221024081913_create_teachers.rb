class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :title
      t.string :photo
      t.references :user, foreign_key: { to_table: :users }


      t.timestamps
    end
  end
end
