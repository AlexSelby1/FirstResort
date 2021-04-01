/* Test */
console.log("Hello from ratings.js");

/* display users rating */
document.addEventListener("turbolinks:load", function() {
  $('.star-rating-show').raty({
  path: '/assets/',
  readOnly: true,
  score: function() {
        return $(this).attr('data-score');
}
});
});
/* create users rating */
document.addEventListener("turbolinks:load", function() {
  $('#star-rating').raty({
    path: '/assets/',
    scoreName: 'review[rating]'
  });
});