window.setCookieConsentStatus = function (status) {
  const days = status === "allow" ? 365 : 31;

  const expiryDate = new Date();
  expiryDate.setTime(expiryDate.getTime() + days * 24 * 60 * 60 * 1000);

  document.cookie =
    "WJ__cookieConsentStatus=" +
    status +
    "; expires=" +
    expiryDate.toUTCString() +
    "; path=/; SameSite=Lax";

  // Fade out cookie notice
  document.querySelectorAll(".cookie-notice").forEach((el) => {
    el.style.transition = "opacity 0.2s ease";
    el.style.opacity = "0";

    setTimeout(() => {
      el.style.display = "none";
    }, 200);
  });

  // Reload if accepted
  if (status === "allow") {
    window.location.reload();
  }
};