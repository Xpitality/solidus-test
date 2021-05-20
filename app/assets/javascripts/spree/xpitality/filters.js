const handleFilters = () => {
  const filtersHolder = document.querySelector(".filters-holder");
  if (filtersHolder) {
    const selectHolders = document.querySelectorAll(".filter-options-holder");
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
  const checkCountries = document.getElementsByName("country");
  if(checkCountries){
    checkCountries.forEach((country)=>{
      const region = country.querySelector('div[name="region"]')
      const countryItem = country.querySelector('.dropdown-item-title');
      const checkbox = countryItem.getElementsByTagName('input')[0];
      const switcher = () => {
        const regions = document.querySelectorAll('div[name="region"]');
        regions.forEach(region => {
          if(region.classList.contains('show')){
            region.classList.remove('show');
          }
        })
      }
      if(checkbox){
        checkbox.addEventListener("click",(e)=>{
            switcher()
            region.classList.toggle('show');
        })  
      }
    })
  }
};
