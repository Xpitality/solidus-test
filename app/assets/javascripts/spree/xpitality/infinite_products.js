(function () {
  $(function () {
    $('.infinite-scroll-container').infinitePages({
      // debug: true,
      loading: function () {
        return $(this).text('Caricamento altri prodotti...');
      },
      error: function () {
        return $(this).button('Si è verificato un errore, ti preghiamo di riprovare.');
      }
    });
  });
}).call(this);