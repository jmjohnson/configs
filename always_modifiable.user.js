// ==UserScript==
// @match https://calendar.google.com/calendar/render*
// ==/UserScript==

var intervalId = window.setInterval(function(){
  var guestsModify = document.evaluate('//*[contains(@id,"guests-modify")]', document).iterateNext();
  
  if (guestsModify) {
    guestsModify.checked = true;
    window.clearInterval(intervalId);
  }
}, 100);
