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

// Get video asset duration
function getVideoDuration(el) {
  var duration = Math.round(el.duration);
  duration = formatTime(duration);

  $(el).siblings('.video__button').find(".video-duration").text(duration);
}

function formatTime(time) {
  // Hours, minutes and seconds
  var hrs = ~~(time / 3600);
  var mins = ~~((time % 3600) / 60);
  var secs = ~~time % 60;

  // Output like "1:01" or "4:03:59" or "123:03:59"
  var ret = "";
  if (hrs > 0) {
      ret += "" + hrs + ":" + (mins < 10 ? "0" : "");
  }
  ret += "" + mins + ":" + (secs < 10 ? "0" : "");
  ret += "" + secs;
  return ret;
}