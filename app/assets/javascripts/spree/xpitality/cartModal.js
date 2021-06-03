const handleCartModal = () => {
  const cartButton = document.querySelector(".cart-nav-button");
  const cartModal = document.querySelector("#cart-modal");
  const carWrapper = document.querySelector('.cart-nav');

  cartButton.addEventListener("click", () => {
    if (cartModal.classList.contains("show")) {
      cartModal.classList.remove("show");
    } else {
      cartModal.classList.add("show");
    }
  });
  carWrapper.addEventListener("mouseleave",()=>{
    cartModal.classList.remove("show");
  })
};
