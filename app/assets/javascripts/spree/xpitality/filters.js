const handleFilters = () => {
  const filtersHolder = document.querySelector(".filters-holder");
  if (filtersHolder) {
    const selectHolders = document.querySelectorAll(".filter-select-holder");
    const countryHolder = document.querySelectorAll(".dropdown-item");
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
    //country swicher
    countryHolder.forEach((item) => {
      const region = item.querySelector(".dropdown-subitem-wrapper");
      item.addEventListener("click", (e) => {
          region.classList.toggle("show");
      });
    });
  }
};
