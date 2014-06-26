class AddPriceRangeAndRemoveMinAndMaxPriceToRestaurants < ActiveRecord::Migration
  def change
  	remove_column :restaurants, :price_min
  	remove_column :restaurants, :price_max
  	add_column :restaurants, :price_range, :string
  end
end
