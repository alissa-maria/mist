window.onresize = checkSideBar;

function checkSideBar() {
  var x = document.getElementById("nav-list");
  if (window.innerWidth > 1200) {
    x.style.display = "block";
  } 
}

function toggleVisibility() {
  var x = document.getElementById("nav-list");
  if (x.style.display === "block") {
    x.style.display = "none";
  } else {
    x.style.display = "block";
  }
}