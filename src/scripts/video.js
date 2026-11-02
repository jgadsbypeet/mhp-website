document.querySelectorAll(".video__button").forEach(function (button) {
  button.addEventListener("click", function () {
    const parent = button.closest(".video__frame");
    const videoEl = button.parentElement.querySelector(".video__asset");

    if (!videoEl) return;

    if (parent) {
      parent.classList.add("video__playing");
    }

    // if uploaded video
    if (videoEl.classList.contains("video__asset--uploaded")) {
      videoEl.play();
    } 
    // else youtube or vimeo video
    else {
      videoEl.src += "?autoplay=1";
    }
  });
});

document.querySelectorAll(".hero-landing__pause").forEach(function (button) {
  button.addEventListener("click", function () {
    const label = button.querySelector(".sr-only");
    const isPaused = button.getAttribute("aria-pressed") === "true";
    const nextPaused = !isPaused;
    button.setAttribute("aria-pressed", nextPaused ? "true" : "false");
    if (label) {
      label.textContent = nextPaused ? "Play background video" : "Pause background video";
    }
  });
});