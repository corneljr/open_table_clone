class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :address
      t.integer :price_min
      t.integer :price_max
      t.string :summary
      t.string :menu

      t.timestamps
    end
  end
end
