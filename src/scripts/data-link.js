// Add cursor-pointer class to all .data-link elements on page load
$(".data-link").addClass("cursor-pointer");

// Make the whole item clickable
$(".data-link").on("click", function() {
  var linkUrl = $(this).data("link");
  window.location.href = linkUrl;
});