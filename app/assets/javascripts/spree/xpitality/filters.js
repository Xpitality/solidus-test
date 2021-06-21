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
  if (sidemenu) {
    const form = sidemenu.getElementsByTagName("form")[0];
    if (form) {
      sidemenu.addEventListener("change", () => {;
        const hideAfterTime = setInterval(function(){
          const isMobile = /iPhone|iPod|Android/i.test(navigator.userAgent);
          const filters = document.querySelector(".filters");
          if (isMobile) {
            filters.classList.remove("show");
          }
          clearInterval(hideAfterTime)
        },400)
        Rails.fire(form, 'submit');
        });
    }
  }
};
const handleSideMenuScroll = () => {
  const filtersBar = document.querySelector(".filters");
  const filterMobileBtn = document.querySelector(".filters-mobile-btn-holder");
  const footer = document.querySelector("#footer");

  function checkOffset() {
    function getRectTop(el) {
      const rect = el.getBoundingClientRect();
      return rect.top;
    }

    if (
      getRectTop(filtersBar) +
        document.body.scrollTop +
        filtersBar.offsetHeight >=
      getRectTop(footer) + document.body.scrollTop - 10
    ) {
      filtersBar.style.position = "absolute";
    }
    if (
      document.body.scrollTop + window.innerHeight <
      getRectTop(footer) + document.body.scrollTop
    ) {
      filtersBar.style.position = "fixed"; // restore when you scroll up
    }
  }
  const isMobile = /iPhone|iPod|Android/i.test(navigator.userAgent);
  if (isMobile) {
    document.addEventListener("scroll", function () {
      if (window.scrollY <= 115) {
        filterMobileBtn.style.position = "relative";
        filterMobileBtn.style.width = "100%";
      } else {
        filterMobileBtn.style.position = "fixed";
        filterMobileBtn.style.width = "40%";
      }
    });
  } else {
    if (filtersBar) {
      document.addEventListener("scroll", function () {
        checkOffset();
        if (window.scrollY > 100) {
          filtersBar.style.top = "35%";
        } else {
          filtersBar.style.top = "inherit";
        }
      });
    }
  }
}
