module Spree
  class SupplierStockLocation < StockLocation
    belongs_to :supplier, class_name: 'Spree::Supplier'
  end
end
