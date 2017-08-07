class AddAddressToAddressQuery < ActiveRecord::Migration[5.0]
  def change
    add_column :address_queries, :address, :string
  end
end
