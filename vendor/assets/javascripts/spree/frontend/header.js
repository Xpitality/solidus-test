const handleHeader = () => {
  const hamburger = document.querySelector(".hamburger");
  const navBar = document.querySelector(".navbar");
  const navLinks = [...document.querySelectorAll(".nav-link-with-drop")];

  hamburger.addEventListener("click", () => {
    if (navBar.classList.contains("show")) {
      navBar.classList.remove("show");
    } else {
      navBar.classList.add("show");
    }
  });
  
  // Handling nav links
  navLinks.forEach((link) => {
    link.addEventListener("click", (event) => {
      event.preventDefault();
      const allDrops = [...document.querySelectorAll(".nav-dropdown")];
      const drop = event.target.parentElement.querySelector(".nav-dropdown");

      if (drop.classList.contains("show")) {
        drop.classList.remove("show");
      } else {
        allDrops.forEach((el) => {
          el.classList.remove("show");
        });
        drop.classList.add("show");
      }
    });
  });
};
