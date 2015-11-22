// ==UserScript==
// @name          Always allow events modifiable
// @description   Always makes google calendar events modifiable.
// @match       https://www.google.com/calendar/*
// ==/UserScript==

window.setInterval(function(){
  var elem = document.querySelector('.ep-go-guests-can input');
  if (elem &&
      elem.id.match(/:.*guests-modify/))
	  elem.checked = true;
	
}, 500);
