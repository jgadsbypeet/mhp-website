// Make the whole item clickable
$(".data-link").on("click", function() {
  var linkUrl = $(this).data("link");
  window.location.href = linkUrl;
});

// Add the classes to the item using JavaScript because if JavaScript fails, these styles would be deceptive
$(".data-link").addClass("cursor-pointer  group");