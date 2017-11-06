//= require_tree ./templates

(function($) {
  var newStockTransfer = {
    init: function() {
      if($('#stock_transfer_source_location_field').length) {
        var supplierTemplate = HandlebarsTemplates['stock_transfers/supplier_checkbox'];
        $('#stock_transfer_source_location_field').before(supplierTemplate);
        this.getLocations();
        this.addCheckboxEvent();
      }
    },

    getLocations: function() {
      var locationsUrl = '/admin/stock_locations';
      $.get(locationsUrl, function(data) {
        Spree.StockLocations = data;
      });
    },

    populateSelect: function(locationsType) {
      var select = $('#stock_transfer_source_location_id');
      var locations = Spree.StockLocations[locationsType];
      select.children().remove();
      withBlank = [{ name: '', id: ''}].concat(locations)
      $.map(withBlank, function(location) {
        var opt = $(document.createElement('option')).attr('value', location.id).html(location.name);
        select.append(opt);
      });
    },

    addCheckboxEvent: function() {
      var _this = this;
      $('#supplier').change(function() {
        if (this.checked) {
          _this.populateSelect('supplier');
        } else {
          _this.populateSelect('store');
        }
      });
    }
  };

  Spree.ready(function() {
    newStockTransfer.init();
  });
}(jQuery));
