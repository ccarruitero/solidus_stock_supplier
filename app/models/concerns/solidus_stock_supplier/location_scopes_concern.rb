module SolidusStockSupplier
  module LocationScopesConcern
    extend ActiveSupport::Concern
    
    included do
      scope :for_store, -> { where(type: 'Spree::StockLocation') }
    end
  end
end
