// Make the whole item clickable
document.querySelectorAll(".data-link").forEach(function (el) {
  el.addEventListener("click", function () {
    const linkUrl = el.dataset.link;
    if (linkUrl) {
      window.location.href = linkUrl;
    }
  });

  // Add classes (only when JS runs)
  el.classList.add("cursor-pointer", "group");
});