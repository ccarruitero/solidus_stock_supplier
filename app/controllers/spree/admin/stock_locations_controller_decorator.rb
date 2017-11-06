Spree::Admin::StockLocationsController.class_eval do
  def index
    @stock_locations = Spree::StockLocation.for_store
    @locations = Spree::StockLocation.accessible_by(current_ability, :read)
  end
end
