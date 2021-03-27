console.log("Hello from ratings.js");

document.addEventListener("turbolinks:load", function() {
  $('.star-rating-show').raty({
  path: '/assets/',
  readOnly: true,
  score: function() {
        return $(this).attr('data-score');
}
});
});

document.addEventListener("turbolinks:load", function() {
  $('#star-rating').raty({
    path: '/assets/',
    scoreName: 'review[rating]'
  });
});