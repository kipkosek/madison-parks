class DropAddressQueries < ActiveRecord::Migration[5.0]
  def change
    drop_table :address_queries
  end
end
