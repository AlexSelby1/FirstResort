$(function() {
  $('.star-rating-show').raty({
  path: '/assets/',
  readOnly: true,
  score: function() {
        return $(this).attr('data-score');
}
});
});
$(function() {
  $('#star-rating').raty({
    path: '/assets/',
    scoreName: 'review[rating]'
  });
});