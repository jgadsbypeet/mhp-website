function setCookieConsentStatus(status) {
    const days = status == "allow" ? 365 : 31; // Set the cookie for a year if they accept cookies and for a month if they don't accept cookies
    const expiry = new Date(new Date().getTime()+1000*60*60*24*days).toGMTString();
    document.cookie = "WJ__cookieConsentStatus=" + status + "; expires=" + expiry + "; path=/";
    $(".cookie-notice").fadeOut("fast"); // Close cookie notice
    if ( status == "allow" ) {
        window.location.reload(); // Reload the page so scripts are processed
    }
}