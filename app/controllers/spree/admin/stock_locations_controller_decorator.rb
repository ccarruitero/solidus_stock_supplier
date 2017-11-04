Spree::Admin::StockLocationsController.class_eval do
  def index
    @stock_locations = Spree::StockLocation.for_store
  end
end
