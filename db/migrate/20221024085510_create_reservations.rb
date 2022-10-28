class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :reservation_date
      t.string :city
      t.references :teacher, foreign_key: true
      t.references :user, foreign_key: true
      t.index [:user_id, :teacher_id], unique: true

      t.timestamps
    end
  end
end
