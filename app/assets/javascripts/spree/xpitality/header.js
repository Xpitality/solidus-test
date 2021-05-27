const handleHeader = () => {
  const hamburger = document.querySelector(".hamburger");
  const navBar = document.querySelector(".navbar");
  const navLinks = [...document.querySelectorAll(".nav-link-with-drop")];
  const searchHolder = document.getElementById('search-bar');
  const originDiv = document.querySelector('.nav-dropdown-country');
  const titleOrigin = originDiv.querySelectorAll('.drop-title');
  const dropdown = document.querySelectorAll('.nav-dropdown');

  hamburger.addEventListener("click", () => {
    if (navBar.classList.contains("show")) {
      navBar.classList.remove("show");
      searchHolder.style.display= 'flex'
    } else {
      navBar.classList.add("show");
      searchHolder.style.display= 'none'
    }
  });
  
  // Handling nav links
  navLinks.forEach((link) => {
    link.addEventListener("mouseover", (event) => {
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
    link.addEventListener("click",(e)=>{
      e.preventDefault();
    })
  });
  
  //hide the drop
  dropdown.forEach(drop => {
    drop.addEventListener("mouseleave",(e)=>{
      drop.classList.remove("show");
    })
  })

  //Handling regions sidebar
  titleOrigin.forEach((title)=>{
    title.addEventListener("click", (e)=>{
      const wrapper = originDiv.querySelectorAll('.drop-link-holder');
      wrapper.forEach((el)=>{
        const titleDiv = el.querySelector(".origine-main");
        el.querySelector(".origine-regions").classList.remove("show");
        if(titleDiv.contains(e.target)){
          el.querySelector(".origine-regions").classList.add("show");
        }
      })
    })
  })

};
