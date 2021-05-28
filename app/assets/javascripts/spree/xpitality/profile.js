const handleProfile = () => {
  handleNavLinks();
  handleOrders();
};

const handleNavLinks = () => {
  const navLinks = document.querySelectorAll(".profile-nav-link");
  if (navLinks) {
    checkForActive(navLinks);
    navLinks.forEach((navLink) => {
      navLink.addEventListener("click", () => {
        navLinks.forEach((link) => {
          link.classList.remove("active");
        });
        navLink.classList.add("active");
        checkForActive(navLinks);
        handleOrders();
      });
    });
  }
};

const checkForActive = (links) => {
  links.forEach((navLink) => {
    if (navLink.classList.contains("active")) {
      document.querySelector(".profile-info").classList.remove("active");
      document.querySelector(".profile-orders").classList.remove("active");
      document
        .querySelector(
          `[profile-nav=${navLink.getAttribute("profile-nav-for")}]`
        )
        .classList.add("active");
    }
  });
};

const handleOrders = () => {
  const ordersHolder = document.querySelector(".orders-holder");
  if (ordersHolder) {
    const orders = ordersHolder.querySelectorAll(".order");
    if (orders) {
      orders.forEach((order) => {
        let toggle = false;
        order.addEventListener("click", () => {
          orders.forEach((o) => {
            o.classList.remove("active");
          });
          toggle = !toggle
          if(toggle){
            order.classList.add("active");
          }else{
            order.classList.remove("active");
          }
        });
      });
    }
  }
};
