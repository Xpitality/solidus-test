const handleFilters = () => {
  const filtersHolder = document.querySelector(".filters-holder");
  if (filtersHolder) {
    const selectHolders = document.querySelectorAll(".filter-select-holder");
    //open list
    selectHolders.forEach((item) => {
      const dropdown = item.querySelector(".filter-dropdown");
      if (dropdown) {
        item.addEventListener("click", (e) => {
          const isClickedInside = dropdown.contains(e.target);
          if (!isClickedInside) {
            dropdown.classList.toggle("show");
          }
        });
      }
    });
  }
};
const handleFiltersMobile = () => {
  const btn = document.getElementById("filters-mobile");
  const close = document.querySelector(".close-btn");
  const filters = document.querySelector(".filters");
  btn.addEventListener("click", () => {
    if (filters) {
      filters.classList.add("show");
    }
  });
  close.addEventListener("click", () => {
    if (filters) {
      filters.classList.remove("show");
    }
  });
};
const handleCountryCheck = () => {
  const checkCountries = document.querySelectorAll(".dropdown-item");

  checkCountries.forEach((country) => {
    const regions = country.querySelector(".dropdown-subitem-wrapper");
    const checkbox = country.querySelector("#Paese_");
    if (checkbox) {
      checkbox.addEventListener("click", () => {
        regions.classList.toggle("show"); 
      });
    }
  });
};
