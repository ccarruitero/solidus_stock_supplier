module SolidusStockSupplier
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'solidus_stock_supplier'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer 'solidus_stock_supplier.menu', before: :load_config_initializers do
      Spree::Backend::Config.configure do |config|
        config.menu_items << config.class::MenuItem.new(
          [:suppliers],
          'industry',
          condition: -> { can?(:admin, :suppliers) }
        )
      end
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
