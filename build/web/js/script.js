(function($) {

  "use strict";

  // init Chocolat light box
  var initChocolat = function() {
  Chocolat(document.querySelectorAll('.image-link'), {
      imageSize: 'contain',
      loop: true,
    })
  }

  // Sidebar
  $(document).ready(function () {           

      $('.closenav').on('click', function () {
          $('.sidenavbar').removeClass('active');
      });

      $('.btn-menu').on('click', function () {
          $('.sidenavbar').addClass('active');
      });

      initChocolat();
  });


})(jQuery);
