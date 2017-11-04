module SolidusStockSupplier
  module StockItemsControllerExtension
    def load_stock_management_data
      super | @stock_locations = Spree::StockLocation.for_store.accessible_by(current_ability, :read)
    end
  end
end
