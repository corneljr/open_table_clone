class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :date
      t.integer :user_id
      t.integer :guest_count
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
