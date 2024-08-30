var mobileNavButton = $("#mobileNavButton");
var siteHeaderNav = $("#siteHeaderNav");
var panelTrigger = $(".header-nav__panel--trigger");
var panelOverlay = $(".header-nav--overlay");

// mobile menu show/hide
mobileNavButton.on("click", function() {
  let isActive = $(this).hasClass("active") && siteHeaderNav.hasClass("active");

  if (!isActive) 
  {
    $(this).addClass("active");
    $(this).attr("aria-expanded", "true");
    $(this).find(".burger-menu-button-text").text("Close");
    siteHeaderNav.addClass("active");
    panelOverlay.addClass("active");
  } 
  else 
  {
    $(this).removeClass("active");
    $(this).attr("aria-expanded", "false");
    $(this).find(".burger-menu-button-text").text("Menu");
    siteHeaderNav.removeClass("active");
    panelOverlay.removeClass("active");
  }
});

// sub menu (panels) show/hide
panelTrigger.on("click", function() {
  menuPanel($(this));
});

// when press menu bar item
panelTrigger.keydown(function(e) {
  const code = e.keyCode || e.which;
  // Enter or space or down
  if (code == 13 || code == 32 || code == 40) 
  {
    menuPanel($(this));
  }
  // shift key and tab or space or down
  else if ((e.shiftKey) && (code == 9 || code == 32 || code == 40)) 
  {
    menuPanelClose($(this));
  }
});

// when shift-press the first menu item in menu panel
$(".header-nav__main:first-child > a").keydown(function(e) {
  const code = e.keyCode || e.which;
  let itsTrigger = $(this).closest(".header-nav__panel").siblings(".header-nav__panel--trigger");

  // shift key and tab or space or down
  if ((e.shiftKey) && (code == 9 || code == 32 || code == 40)) 
  {
    menuPanelClose(itsTrigger);
  }
});

// when press the last menu item in menu panel
$(".header-nav__panel li:last-child > a, .header-nav__main:last-child > a").keydown(function(e) {
  const code = e.keyCode || e.which;
  let itsTrigger = $(this).closest(".header-nav__panel").siblings(".header-nav__panel--trigger");

  // no shift key but tab or space or down
  if ((!e.shiftKey) && (code == 9 || code == 32 || code == 40)) 
  {
    menuPanelClose(itsTrigger);
  }
});

// close all menus on overlay click
panelOverlay.on("click", function() {
  mobileNavButton.removeClass("active");
  mobileNavButton.attr("aria-expanded", "false");
  mobileNavButton.find(".burger-menu-button-text").text("Menu");
  siteHeaderNav.removeClass("active");
  panelTrigger.removeClass("active");
  panelTrigger.attr("aria-expanded", "false");
  $(".header-nav__panel").removeClass("active");
  $(this).removeClass("active");
});

function menuPanel(el) {
  let isActive = el.hasClass("active");

  // open/close panel
  if (!isActive) 
  {
    menuPanelOpen(el);
  } 
  else 
  {
    menuPanelClose(el);
  }

  // close siblings
  menuSiblingsClose(el);
}

function menuPanelOpen(el) {
  let itsPanel = el.next(".header-nav__panel");

  el.addClass("active");
  el.attr("aria-expanded", "true");
  itsPanel.addClass("active");
  itsPanel.find("a").attr("tabindex", 0);
  // add overlay
  panelOverlay.addClass("active");
}

function menuPanelClose(el) {
  let itsPanel = el.next(".header-nav__panel");

  el.removeClass("active");
  el.attr("aria-expanded", "false");
  itsPanel.removeClass("active");
  itsPanel.find("a").attr("tabindex", -1);
  // remove overlay
  panelOverlay.removeClass("active");
}

function menuSiblingsClose(el) {
  let itsSiblings = el.parent("li").siblings().find(".header-nav__panel--trigger");
  let itsPanelSiblings = itsSiblings.next(".header-nav__panel");

  itsSiblings.removeClass("active");
  itsPanelSiblings.removeClass("active");
  itsPanelSiblings.find("a").attr("tabindex", -1);
}