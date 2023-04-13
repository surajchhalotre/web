class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.integer :price
      t.integer :room_num
      t.string :room_type

      t.timestamps
    end
  end
end
