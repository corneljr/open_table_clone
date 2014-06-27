class AddLoyaltyPointsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :loyalty_points, :integer, default: 0
  end
end
