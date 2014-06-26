class RemoveMenuFromRestaurants < ActiveRecord::Migration
  def change
  	remove_column :restaurants, :menu
  end
end
