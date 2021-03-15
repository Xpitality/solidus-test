const handleCartModal = () => {
  const cartButton = document.querySelector(".cart-nav-button");
  const cartModal = document.querySelector(".cart-modal");

  cartButton.addEventListener("click", () => {
    if (cartModal.classList.contains("show")) {
      cartModal.classList.remove("show");
    } else {
      cartModal.classList.add("show");
    }
  });
};
