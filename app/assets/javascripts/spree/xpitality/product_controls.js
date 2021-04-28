Spree.ready(function ($) {
  Spree.handleProductControls = function () {
    var plusButtons = $("form .product-controls .btn-control-cart.plus");
    var minusButtons = $("form .product-controls .btn-control-cart.minus");
    
    plusButtons.each(function () {
      var $plusButton = $(this);
      var $productControls = $plusButton.parent('.product-controls');
      var $quantityValue = $productControls.find(".quantity-value");
      var $quantityInput = $productControls.find(".quantity-input");

      $plusButton.on("click", function (event) {
        var quantity = parseInt($quantityValue.attr("data-quantity"), 10) + 1;
        var maxQuantity = parseInt($quantityValue.attr("data-max-product-quantity"), 10);
        if (quantity <= maxQuantity) {
          $quantityValue.attr("data-quantity", quantity);
          $quantityValue.html(quantity);
          $quantityInput.val(quantity);
        }
      });
    });
    
    minusButtons.each(function () {
      var $minusButton = $(this);
      var $productControls = $minusButton.parent('.product-controls');
      var $quantityValue = $productControls.find(".quantity-value");
      var $quantityInput = $productControls.find(".quantity-input");
      
      $minusButton.on("click", function (event) {
        var quantity = parseInt($quantityValue.attr("data-quantity"), 10) - 1;
  
        if (quantity > 0) {
          $quantityValue.attr("data-quantity", quantity);
          $quantityValue.html(quantity);
          $quantityInput.val(quantity);
        }
      });
    });
  };
  
  Spree.handleProductControls();
});