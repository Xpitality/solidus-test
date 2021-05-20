const handlePriceSlider = () => {
  const slider = document.querySelector('[name="price_lte"]');
  if (slider) {
    const max = 200;
    const min = 0;
    slider.max = max;
    slider.min = min;
    slider.value = 75;
    const percent = (e) => {
      const value = ((e.target.value - min) * 100) / (max - min);
      return value;
    };

    const renderNumber = (e) => {
      //variables and calculation
      const value = e.target.value.toString();
      const length = max.toString().length;
      const price = document.querySelector(".slider-value");
      if (price) {
        for (let i = 0; i < length; i++) {
          const numHolder = price.querySelectorAll(".slider-value-number");
          numHolder.forEach((num, index) => {
            const visible = index + 1 > length - value.length;
            const position = visible? "-" + value[index - (length - value.length)] * 10 + "%": "10%";
            const valueHolder = num.querySelector(".value-holder");
            valueHolder.style.transform= "translateY(" + position + ")";
            valueHolder.style.opacity= visible ? "1" : "0";
          });
        }
      }
    };

    slider.addEventListener("mousemove", (e) => {
      //update background size of slider
      e.target.style.backgroundSize = percent(e) + "% 100%";
      //render value
      renderNumber(e);
    });
  }
};
