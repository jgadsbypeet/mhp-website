document.getElementById("goBackLink")?.addEventListener("click", function (e) {
  e.preventDefault();

  if (window.history.length > 1) {
    history.back();
  } else {
    window.location.href = "/";
  }
});