class AddTypeToStockLocations < SolidusSupport::Migration[5.1]
  def change
    add_column :spree_stock_locations, :type, :string, default: 'Spree::StockLocation'
    add_column :spree_stock_locations, :supplier_id, :integer
  end
end
