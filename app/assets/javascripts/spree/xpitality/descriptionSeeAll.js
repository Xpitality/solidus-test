const handleSeeMoreOptions = () => {
  seeMoreProducerPage();
  seeMoreSinglePage();
};
const seeMoreProducerPage = () => {
  const maxCharacters = 930;
  if (document.querySelector(".selected-taxon-description")) {
    const description = document.querySelector(".taxon-description");
    const seeMore = document.querySelector(".taxon-see-more-btn");
    const descriptionFullText = description.innerHTML;
    if (descriptionFullText.length > maxCharacters) {
      description.innerHTML =
        description.innerHTML.substring(0, maxCharacters) + "...";
      seeMore.style.display = "block";
      seeMore.addEventListener("click", () => {
        description.innerHTML = descriptionFullText;
        seeMore.style.display = "none";
      });
    }
  }
};
const seeMoreSinglePage = () =>{
  const maxCharacters = 930;
  if (document.querySelector(".cellar-bottom")) {
    const description = document.querySelector(".cellar-bottom").getElementsByTagName('p')[0];
    const seeMore =  document.querySelector(".taxon-see-more-btn");
    const descriptionFullText = description.innerHTML;
    if (descriptionFullText.length > maxCharacters) {
      description.innerHTML =
        description.innerHTML.substring(0, maxCharacters) + "...";
      seeMore.style.display = "block";
      seeMore.addEventListener("click", () => {
        description.innerHTML = descriptionFullText;
        seeMore.style.display = "none";
      });
    }
  }
}