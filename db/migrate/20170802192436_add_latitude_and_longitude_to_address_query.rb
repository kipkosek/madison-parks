class AddLatitudeAndLongitudeToAddressQuery < ActiveRecord::Migration[5.0]
  def change
    add_column :address_queries, :latitude, :float
    add_column :address_queries, :longitude, :float
  end
end
