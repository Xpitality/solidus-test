(function () {
  $(function () {
    $('.infinite-scroll-container').infinitePages({
      // debug: true,
      loading: function () {
        return $(this).text('Loading next page...');
      },
      error: function () {
        return $(this).button('There was an error, please try again');
      }
    });
  });
}).call(this);