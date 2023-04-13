class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :name
      t.integer :mobile
      t.date :start_date
      t.date :end_date
      t.integer :age
      t.string :user_id
      t.string :room_id

      t.timestamps
    end
  end
end
