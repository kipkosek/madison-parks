$(document).ready(function() {
  $('.btn-search').on('click', function() {
    $('body').animate({
      scrollTop: $('#results').offset().top
    }, 1000);
  });
});
