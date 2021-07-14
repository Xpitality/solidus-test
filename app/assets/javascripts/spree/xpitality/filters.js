const handleFilterOptions = () => {
  handleFilters();
  handleFiltersMobile();
  handleCountryCheck();
  handleFilterForm();
  handleSideMenuScroll();
};

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
  if (btn) {
    btn.addEventListener("click", () => {
      if (filters) {
        filters.classList.add("show");
      }
    });
  }
  if (close) {
    close.addEventListener("click", () => {
      if (filters) {
        filters.classList.remove("show");
      }
    });
  }
};
const handleCountryCheck = () => {
  const checkCountries = document.getElementsByName("country");
  if (checkCountries) {
    checkCountries.forEach((country) => {
      const region = country.querySelector('div[name="region"]');
      const countryItem = country.querySelector(".dropdown-item-title");
      const checkbox = countryItem.getElementsByTagName("input")[0];
      const switcher = () => {
        const regions = document.querySelectorAll('div[name="region"]');
        regions.forEach((region) => {
          if (region.classList.contains("show")) {
            region.classList.remove("show");
          }
        });
      };
      if (checkbox) {
        checkbox.addEventListener("click", (e) => {
          switcher();
          region.classList.toggle("show");
        });
      }
    });
  }
};
const handleFilterForm = () => {
  const sidemenu = document.querySelector(".filters");
  const resetBtn = document.getElementById('reset_btn');
  if (sidemenu) {
    const form = sidemenu.getElementsByTagName("form")[0];
    if (form) {
      sidemenu.addEventListener("change", () => {;
        const hideAfterTime = setInterval(function() {
          const isMobile = /iPhone|iPod|Android/i.test(navigator.userAgent);
          if (isMobile) {
            sidemenu.classList.remove("show");

          }
          clearInterval(hideAfterTime);
          }, 400)
        Rails.fire(form, 'submit');
      });
      resetBtn.addEventListener('click',()=>{
        const checkbox  = form.querySelectorAll('input[type=checkbox]');
        const slider  = document.getElementById('price_lte');
        checkbox.forEach(input => {
          input.checked = false;
        });
        slider.value= 50;
        slider.click();
        sidemenu.classList.remove("show");
        Rails.fire(form, 'submit');
      });
    } 
  }
};
const handleSideMenuScroll = () => {
  const filtersBar = document.querySelector(".filters");
  const filterMobileBtn = document.querySelector(".filters-mobile-btn-holder");
  const footer = document.querySelector("#footer");

  function checkOffsetFilterBar() {
    function getRectTop(el) {
      const rect = el.getBoundingClientRect();
      return rect.top;
    }
    const heightOfFilterBar = getRectTop(filtersBar) + document.body.scrollTop + filtersBar.offsetHeight;
    const heightOfAreaFromTopToFooter = getRectTop(footer) + document.body.scrollTop - 10;
    const innerHeightArea = document.body.scrollTop + window.innerHeight;
    const heightFromFooterToTop = getRectTop(footer) + document.body.scrollTop;
    if (heightOfFilterBar >= heightOfAreaFromTopToFooter) {
      filtersBar.style.position = "relative";
      filtersBar.classList.remove('filter-resize');
    }
    if (innerHeightArea < heightFromFooterToTop) {
      filtersBar.style.position = "fixed"; // restore when you scroll up
      filtersBar.classList.add('filter-resize');
    }
    if (window.scrollY==0){
      filtersBar.style.position = "relative"; // default
      filtersBar.classList.remove('filter-resize');
    }
  };
  const isMobile = /iPhone|iPod|Android/i.test(navigator.userAgent);
  const headerTop = document.querySelector('.header-top-bar');
  if (isMobile) {
    document.addEventListener("scroll", function() {
      if(filterMobileBtn){
        if (window.scrollY <= 115) {
          filterMobileBtn.style.position = "relative";
          filterMobileBtn.style.width = "100%";
          headerTop.style.display = 'flex';
          filterMobileBtn.style.top = '0';
          filterMobileBtn.style.left = '0';
          filterMobileBtn.querySelector('.btn').classList.remove('btn-scroll-style');
        } else {       
          filterMobileBtn.style.position = "fixed"; // restore when you scroll up
          filterMobileBtn.style.width = "40%";
          headerTop.style.display = 'none';
          filterMobileBtn.style.top = '92px';
          filterMobileBtn.style.left = '34%';
          filterMobileBtn.querySelector('.btn').classList.add('btn-scroll-style');
        }
      }
    });
  } else if (filtersBar) {
      document.addEventListener("scroll", function() {
        checkOffsetFilterBar();
        if (window.scrollY > 150) {
          filtersBar.style.top = "24%";
        } else {
          filtersBar.style.top = "inherit";
        }
      });
  }
}