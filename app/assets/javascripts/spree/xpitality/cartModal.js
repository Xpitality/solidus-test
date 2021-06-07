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
  
  if(plusButtons){
    plusButtons.forEach((btn)=>{
      btn.addEventListener('contextmenu', event => event.preventDefault());
    } )
  }

  if(minusButtons){
    plusButtons.forEach((btn)=>{
      btn.addEventListener('contextmenu', event => event.preventDefault());
    } )
  }  
}