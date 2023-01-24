var images = document.querySelectorAll('img');
console.log(images);

for (const image of images) {
  image.setAttribute("href", image.src);
  image.setAttribute("data-title", image.alt);
  image.setAttribute("data-lightbox", "gallery");

//   wrapped = "<div id='img-box'><a href=" + image.src + "data-title=" + image.alt + "data-lightbox='gallery'>" + image + "</a></div>";
//   image.parentNode.replaceChild(wrapped, image);
}


/// The following used to work, and then it didn't. What?

// var images = document.querySelectorAll('img');
// console.log(images);

// for (const image of images) {
//   image.setAttribute("href", image.src);
//   image.setAttribute("data-title", image.alt);
//   image.setAttribute("data-lightbox", "gallery");

//   wrapped = "<div id='img-box'>" + image + "</div>";
  
//   replaced = document.querySelector("[alt='" + image.alt + "']");
//   replaced.outerHTML = wrapped;
// }