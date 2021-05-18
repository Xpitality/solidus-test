const handleHeader = () => {
  const hamburger = document.querySelector(".hamburger");
  const navBar = document.querySelector(".navbar");
  const navLinks = [...document.querySelectorAll(".nav-link-with-drop")];
  const searchHolder = document.getElementById('search-bar')

  hamburger.addEventListener("click", () => {
    if (navBar.classList.contains("show")) {
      navBar.classList.remove("show");
      searchHolder.style.display= 'block'
    } else {
      navBar.classList.add("show");
      searchHolder.style.display= 'none'
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
