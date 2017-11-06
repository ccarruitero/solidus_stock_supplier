module SolidusStockSupplier
  module LocationScopesConcern
    extend ActiveSupport::Concern
    
    included do
      scope :for_store, -> { where(type: 'Spree::StockLocation') }
      scope :for_supplier, -> { where(type: 'Spree::SupplierStockLocation') }
    end
  end
end
