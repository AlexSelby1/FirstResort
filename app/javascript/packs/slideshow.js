/* Test */
console.log("Hello from slideshow.js");

/* display slideshow for home page */
window.showSlides = function() {
  var i;
  var slides = document.getElementsByClassName("slides");
  for (var i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}
  slides[slideIndex-1].style.display = "block";
  setTimeout(showSlides, 8000); 
}
var slideIndex = 0;
showSlides();