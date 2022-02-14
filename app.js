const dropdown = document.getElementById("tech-dropdown");
const techList = document.getElementById("rows");

dropdown.addEventListener("input", function(e) {
  const searchTerm = e.target.value;

  Array.from(techList.getElementsByTagName("p")).forEach((element) => {
    if (
      searchTerm === "" ||
      /* Don't search on the word "formerly", e.g. "WorkDocs (formerly Zocalo)" */
      element.dataset.name
        .toLowerCase()
        .replace("(formerly", "")
        .includes(searchTerm.toLowerCase())
    ) {
      element.style.display = "block";
    } else {
      element.style.display = "none";
    }
  });
});
