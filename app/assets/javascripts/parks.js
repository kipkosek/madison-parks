$(document).ready(function() {
  $('.btn-search').on('click', function() {
    $('body,html').animate({
      scrollTop: $('#results').offset().top
    }, 1000);
  });
});
