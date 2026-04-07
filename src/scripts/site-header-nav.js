const mobileNavButton = document.getElementById("mobileNavButton");
const siteHeaderNav = document.getElementById("siteHeaderNav");
const panelTriggers = document.querySelectorAll(".header-nav__panel--trigger");
const panelOverlay = document.querySelector(".header-nav--overlay");

// mobile menu show/hide
mobileNavButton?.addEventListener("click", function () {
  const isActive =
    mobileNavButton.classList.contains("active") &&
    siteHeaderNav?.classList.contains("active");

  const buttonText = mobileNavButton.querySelector(".burger-menu-button-text");

  if (!isActive) {
    mobileNavButton.classList.add("active");
    mobileNavButton.setAttribute("aria-expanded", "true");
    if (buttonText) buttonText.textContent = "Close";
    siteHeaderNav?.classList.add("active");
    panelOverlay?.classList.add("active");
  } else {
    mobileNavButton.classList.remove("active");
    mobileNavButton.setAttribute("aria-expanded", "false");
    if (buttonText) buttonText.textContent = "Menu";
    siteHeaderNav?.classList.remove("active");
    panelOverlay?.classList.remove("active");
  }
});

// sub menu (panels) show/hide
panelTriggers.forEach((trigger) => {
  trigger.addEventListener("click", function () {
    menuPanel(trigger);
  });

  // when press menu bar item
  trigger.addEventListener("keydown", function (e) {
    const code = e.keyCode || e.which;

    // Enter or space or down
    if (code === 13 || code === 32 || code === 40) {
      menuPanel(trigger);
    }
    // shift key and tab or space or down
    else if (e.shiftKey && (code === 9 || code === 32 || code === 40)) {
      menuPanelClose(trigger);
    }
  });
});

// when shift-press the first menu item in menu panel
document.querySelectorAll(".header-nav__main:first-child > a").forEach((link) => {
  link.addEventListener("keydown", function (e) {
    const code = e.keyCode || e.which;
    const panel = link.closest(".header-nav__panel");
    const itsTrigger = panel?.previousElementSibling;

    // shift key and tab or space or down
    if (e.shiftKey && (code === 9 || code === 32 || code === 40)) {
      if (itsTrigger?.classList.contains("header-nav__panel--trigger")) {
        menuPanelClose(itsTrigger);
      }
    }
  });
});

// when press the last menu item in menu panel
document
  .querySelectorAll(".header-nav__panel li:last-child > a, .header-nav__main:last-child > a")
  .forEach((link) => {
    link.addEventListener("keydown", function (e) {
      const code = e.keyCode || e.which;
      const panel = link.closest(".header-nav__panel");
      const itsTrigger = panel?.previousElementSibling;

      // no shift key but tab or space or down
      if (!e.shiftKey && (code === 9 || code === 32 || code === 40)) {
        if (itsTrigger?.classList.contains("header-nav__panel--trigger")) {
          menuPanelClose(itsTrigger);
        }
      }
    });
  });

// close all menus on overlay click
panelOverlay?.addEventListener("click", function () {
  mobileNavButton?.classList.remove("active");
  mobileNavButton?.setAttribute("aria-expanded", "false");

  const buttonText = mobileNavButton?.querySelector(".burger-menu-button-text");
  if (buttonText) buttonText.textContent = "Menu";

  siteHeaderNav?.classList.remove("active");

  panelTriggers.forEach((trigger) => {
    trigger.classList.remove("active");
    trigger.setAttribute("aria-expanded", "false");
  });

  document.querySelectorAll(".header-nav__panel").forEach((panel) => {
    panel.classList.remove("active");
  });

  panelOverlay.classList.remove("active");
});

function menuPanel(el) {
  const isActive = el.classList.contains("active");

  // open/close panel
  if (!isActive) {
    menuPanelOpen(el);
  } else {
    menuPanelClose(el);
  }

  // close siblings
  menuSiblingsClose(el);
}

function menuPanelOpen(el) {
  const itsPanel = el.nextElementSibling;

  if (!itsPanel || !itsPanel.classList.contains("header-nav__panel")) return;

  el.classList.add("active");
  el.setAttribute("aria-expanded", "true");
  itsPanel.classList.add("active");

  itsPanel.querySelectorAll("a").forEach((link) => {
    link.setAttribute("tabindex", "0");
  });

  // add overlay
  panelOverlay?.classList.add("active");
}

function menuPanelClose(el) {
  const itsPanel = el.nextElementSibling;

  if (!itsPanel || !itsPanel.classList.contains("header-nav__panel")) return;

  el.classList.remove("active");
  el.setAttribute("aria-expanded", "false");
  itsPanel.classList.remove("active");

  itsPanel.querySelectorAll("a").forEach((link) => {
    link.setAttribute("tabindex", "-1");
  });

  // remove overlay
  panelOverlay?.classList.remove("active");
}

function menuSiblingsClose(el) {
  const parentLi = el.closest("li");
  if (!parentLi || !parentLi.parentElement) return;

  const siblingLis = Array.from(parentLi.parentElement.children).filter(
    (li) => li !== parentLi
  );

  siblingLis.forEach((li) => {
    const siblingTrigger = li.querySelector(".header-nav__panel--trigger");
    const siblingPanel = siblingTrigger?.nextElementSibling;

    if (siblingTrigger) {
      siblingTrigger.classList.remove("active");
      siblingTrigger.setAttribute("aria-expanded", "false");
    }

    if (siblingPanel && siblingPanel.classList.contains("header-nav__panel")) {
      siblingPanel.classList.remove("active");

      siblingPanel.querySelectorAll("a").forEach((link) => {
        link.setAttribute("tabindex", "-1");
      });
    }
  });
}