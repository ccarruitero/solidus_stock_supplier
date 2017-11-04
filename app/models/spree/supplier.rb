module Spree
  class Supplier < Spree::Base
    has_many :stock_locations,
      class_name: 'Spree::SupplierStockLocation',
      dependent: :destroy

    validates :name, :uid, presence: true, uniqueness: true

    scope :active, -> { where(active: true) }

    after_create :build_default_stock_location

    def build_default_stock_location
      stock_locations.create(name: name)
    end
  end
end
