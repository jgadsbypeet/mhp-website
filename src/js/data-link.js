// make the whole item clickable
$(".data-link").on("click", function() {
  var linkUrl = $(this).data("link");
  window.location.href = linkUrl;
});