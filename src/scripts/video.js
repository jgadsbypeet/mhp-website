document.querySelectorAll(".video__button").forEach(function (button) {
  button.addEventListener("click", function () {
    const parent = button.closest(".video__frame");
    const videoEl = button.parentElement.querySelector(".video__asset");

    if (parent) {
      parent.classList.add("video__playing");
    }

    if (!videoEl) return;

    // if uploaded video
    if (videoEl.classList.contains("video__asset--uploaded")) {
      videoEl.play();
    } 
    // else youtube or vimeo video
    else {
      videoEl.src += "?autoplay=1";
      // setTimeout(() => { videoEl.style.display = "block"; }, 200);
    }
  });
});