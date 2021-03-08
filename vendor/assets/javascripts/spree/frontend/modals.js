const handleModals = () => {
  const dismissButtons = document.querySelectorAll("[data-dismiss]");
  const locationModal = document.getElementById("location-modal");
  const isLocationModalDismissed = JSON.parse(localStorage.getItem(
    "locationModalDismissed"
  ));

  if (!isLocationModalDismissed) locationModal.classList.add("show");

  dismissButtons.forEach((button) => {
    button.addEventListener("click", () => {
      document.getElementById(button.dataset.dismiss).classList.remove("show");
      localStorage.setItem("locationModalDismissed", true);
    });
  });
};
