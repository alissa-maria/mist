var images = document.querySelectorAll("img");
console.log(images)

for (const image of images) {
  var div = document.createElement("div");
  div.classList.add("img-box");
  var link = document.createElement("a");
  link.setAttribute("href", image.src);
  link.setAttribute("data-title", image.alt);
  link.setAttribute("data-lightbox", "gallery");
  div.appendChild(link);

  var clone = image.cloneNode();

  link.appendChild(clone);

  image.parentNode.replaceChild(div, image);
}