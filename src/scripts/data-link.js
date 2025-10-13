// Add classes to all .data-link elements on page load
$(".data-link").addClass("cursor-pointer  group");

// Make the whole item clickable
$(".data-link").on("click", function() {
  var linkUrl = $(this).data("link");
  window.location.href = linkUrl;
});