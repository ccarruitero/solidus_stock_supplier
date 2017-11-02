module Spree
  class Supplier < Spree::Base
    has_many :stock_location, class_name: 'Spree::SupplierStockLocation'

    validates :name, :uid, presence: true, uniqueness: true

    scope :active, -> { where(active: true) }
  end
end
