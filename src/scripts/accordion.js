var accordionCount = 1;

$(".accordion").each(function () {
  var $this = $(this);

  $this.find(".accordion__trigger").attr({
    id: "accordionTrigger" + accordionCount,
    "aria-controls": "accordionBody" + accordionCount,
  });

  $this.find(".accordion__body").attr({
    id: "accordionBody" + accordionCount,
    "aria-labelledby": "accordionTrigger" + accordionCount,
  });

  return accordionCount++;
});

$("body").on("click", ".accordion__trigger", function() {
  var $this = $(this);
  var parent = $this.parents(".accordion");
  var body = parent.find(".accordion__body");

  if (parent.hasClass("expanded")) {
    $this.attr("aria-expanded", "false");
    body.slideUp("fast");
  } else {
    $this.attr("aria-expanded", "true");
    body.slideDown("fast");
  }

  parent.toggleClass("expanded");
});
