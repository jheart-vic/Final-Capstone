class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :reservation_date
      t.string :city
      t.references :teacher, foreign_key: { to_table: :teachers }
      t.references :user, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
