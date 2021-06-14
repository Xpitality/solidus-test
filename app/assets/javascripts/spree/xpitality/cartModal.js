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
    carWrapper.addEventListener("mouseleave", () => {
        cartModal.classList.remove("show");
    })
};
const preventRightClick = () => {

    const plusButtons = document.querySelectorAll('.plus');
    const minusButtons = document.querySelectorAll('.minus');
    const deleteButtons = document.querySelectorAll('.delete');
    const plusButtonsLinks = document.querySelectorAll('.plus-btn');
    const minusButtonsLinks = document.querySelectorAll('.minus-btn');
    plusButtons.forEach(item => {
        item.addEventListener('contextmenu', function(e) {
            e.preventDefault();
        }, false);
    })
    minusButtons.forEach(item => {
        item.addEventListener('contextmenu', function(e) {
            e.preventDefault();
        }, false);
    })
    deleteButtons.forEach(item => {
        item.addEventListener('contextmenu', function(e) {
            e.preventDefault();
        }, false);
    })
    plusButtonsLinks.forEach(item => {
        item.addEventListener('contextmenu', function(e) {
            e.preventDefault();
        }, false);
    })
    minusButtonsLinks.forEach(item => {
        item.addEventListener('contextmenu', function(e) {
            e.preventDefault();
        }, false);
    })
    window.addEventListener("auxclick", (event) => {
        if (event.button === 1)
            event.preventDefault();
        event.stopPropagation();
    });
}
const detectDomChanges = () => {
    document.addEventListener("DOMNodeInserted", function(e) {
        preventRightClick();
    }, false);
}