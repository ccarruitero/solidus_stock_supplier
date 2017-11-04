Spree::Admin::StockTransfersController.class_eval do
  def load_viewable_stock_locations
    @stock_locations = Spree::StockLocation.for_store.accessible_by(current_ability, :read)
  end

  def load_source_stock_locations
    @source_stock_locations ||= Spree::StockLocation.for_store.accessible_by(current_ability, :transfer_from)
  end

  def load_destination_stock_locations
    @destination_stock_locations ||= Spree::StockLocation.for_store.accessible_by(current_ability, :transfer_to).where.not(id: @stock_transfer.source_location_id)
  end
end
