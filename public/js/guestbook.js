var style =
  "body{background-color:#2c2c2c;color:#fff8d1;}#header-box{padding:0;margin-top:28px;}.comment{background-color:#3c3c3c;box-shadow:3px 3px #000;}";

var stylesheet = document.createElement("style");
stylesheet.innerText = style;

var metatag = document.createElement("meta");
metatag.name = "color-scheme";
metatag.content = "dark light"; 

var hour = new Date().getHours();

if (hour < 7 || hour > 19) {
  document.head.appendChild(stylesheet);
  document.head.appendChild(metatag);

  document.getElementById("guestbook-text").innerHTML =
    "or write about how your day went.";
  document.getElementById("header-img").src = "/img/stars.gif";
}
