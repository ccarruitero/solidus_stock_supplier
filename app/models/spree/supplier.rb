module Spree
  class Supplier < Spree::Base
    validates :name, :uid, presence: true, uniqueness: true

    scope :active, -> { where(active: true) }
  end
end
