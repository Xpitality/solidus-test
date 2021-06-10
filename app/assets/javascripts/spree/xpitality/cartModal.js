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
const preventRightClick = () =>{
  const plusButtons = document.querySelectorAll('.plus');
  const minusButtons = document.querySelectorAll('.minus');
  const deleteButtons = document.querySelectorAll('.close-button');
  
  plusButtons.forEach(item=>{
    item.addEventListener('contextmenu', event => {
      event.preventDefault()
      return false
    });
  })
  minusButtons.forEach(item=>{
    item.addEventListener('contextmenu', event => {
      event.preventDefault()
      return false
    });
  })

  deleteButtons.forEach(item =>{
    item.addEventListener('contextmenu', event => {
      event.preventDefault()
      return false
    });
  })
  window.addEventListener("auxclick", (event) => {
    if (event.button === 1) event.preventDefault();
  });
}