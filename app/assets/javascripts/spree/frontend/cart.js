Spree.ready(function($) {
  if ($("form#update-cart").is("*")) {
    $("form#update-cart a.delete")
      .show()
      .one("click", function() {
        $(this)
          .parents(".line-item")
          .first()
          .find("input.line_item_quantity")
          .val(0);
        $(this)
          .parents("form")
          .first()
          .submit();
        return false;
      });
  }
  $("form#update-cart").submit(function() {
    $("form#update-cart #update-button").attr("disabled", true);
  });
});

Spree.fetch_cart = function(cartLinkUrl) {
  Spree.ajax({
    url: cartLinkUrl || Spree.pathFor("cart_link"),
    success: function(data) {
      $("#link-to-cart").html(data);
    }
  });
};

Spree.fetch_cart_with_items = function() {
  Spree.ajax({
    url: '/orders/refresh',
    success: function(data) {
      $('*[data-hook="cart_with_items"]').html(data);
    }
  });
};