const handleFilters = () => {
  const filtersHolder = document.querySelector(".filters-holder");

  if (filtersHolder) {
    const selectHolders = document.querySelectorAll(".filter-select-holder");

    selectHolders.forEach((item) => {
      const dropdown = item.querySelector(".filter-dropdown");
      if (dropdown) {
        const closeDropdown = (e) => {
          const isClickedInside = dropdown.contains(e.target);
          const isClickedOnItem = item.contains(e.target);

          if (!isClickedInside && !isClickedOnItem) {
            dropdown.classList.remove("show");
            document.removeEventListener("click", closeDropdown);
          }
        };
        item.addEventListener("click", () => {
          if (dropdown.classList.contains("show")) {
            dropdown.classList.remove("show");
            document.removeEventListener("click", closeDropdown);
          } else {
            dropdown.classList.add("show");
            document.addEventListener("click", closeDropdown);
          }
        });
      }
    });
  }
};
