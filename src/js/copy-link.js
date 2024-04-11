var copyLinkBtn = document.querySelectorAll(".copy-link");

for (var i = 0; i < copyLinkBtn.length; i++) {
  var pageUrl = copyLinkBtn[i].dataset.copyLink;
  clickToCopy(copyLinkBtn[i], pageUrl);
}

function clickToCopy(button, textValue) {
  button.onclick = function() {
    navigator.clipboard.writeText(textValue);
  };
}