const handleRadios = () => {
  const radioContainers = document.querySelectorAll(".radio-container");

  console.log(radioContainers);
  radioContainers.forEach((radio) => {
    radio.addEventListener("click", (e) => {
      e.stopPropagation();
      console.log(e.target);
      // if (e.target.querySelector("input").checked) {
      //   radioContainers.forEach((item) => item.classList.remove("checked"));
      //   radio.classList.add("checked");
      // }
    });
  });
};
