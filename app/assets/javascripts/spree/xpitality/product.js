const handleProductCart = () => {
  const plusButton = document.querySelector(
    "#inside-product-cart-form .btn-control-cart.plus"
  );
  const minusButton = document.querySelector(
    "#inside-product-cart-form .btn-control-cart.minus"
  );
  const quantityValue = document.querySelector(".quantity-value");
  const quantityInput = document.querySelector(".quantity-input");

  if (plusButton) {
    plusButton.addEventListener("click", () => {
      const quantity =
        parseInt(quantityValue.getAttribute("data-quantity"), 10) + 1;
      const maxQuantity = parseInt(
        quantityValue.getAttribute("data-max-product-quantity"),
        10
      );
      console.log(quantity);
      console.log(maxQuantity);
      if (quantity <= maxQuantity) {
        quantityValue.setAttribute("data-quantity", quantity.toString());
        quantityValue.innerHTML = quantity.toString();
        quantityInput.value = quantity.toString();
      }
    });
  }

  if (minusButton) {
    minusButton.addEventListener("click", () => {
      const quantity =
        parseInt(quantityValue.getAttribute("data-quantity"), 10) - 1;
      console.log(quantity);
      if (quantity > 0) {
        quantityValue.setAttribute("data-quantity", quantity.toString());
        quantityValue.innerHTML = quantity.toString();
        quantityInput.value = quantity.toString();
      }
    });
  }
};
