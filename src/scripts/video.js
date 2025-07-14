$(".video__button").on("click", function() {
  var $this = $(this);
  var parent = $this.parents(".video__frame");
  var videoEl = $this.siblings(".video__asset");

  parent.addClass("video__playing");

  // if uploaded video
  if (videoEl.hasClass("video__asset--uploaded")) {
    videoEl.trigger("play");
  } 
  // else youtube or vimeo video
  else {
    videoEl[0].src += "?autoplay=1";
    // setTimeout(function(){ videoEl.show(); }, 200);
  }
});