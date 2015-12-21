(function (app, $) {

  function fallbacks() {
    Modernizr.load({
      test: Modernizr.input.placeholder,
      complete: function () {
        if (!Modernizr.input.placeholder) {
          $('input[type="text"], textarea').placeholder();
        }
      }
    }, {
      test: Modernizr.canvas
    });

    if (window.PIE) {
      $('.ie-pie').each(function () {
        PIE.attach(this);
      });
    }
  }

  function visual() {
    spalni_link();


    function spalni_link() {
      $('.spalni_link a').animate({color: '#d70000'}, 1200, function () {
        $('.spalni_link a').animate({color: '#0A74BB'}, 1200, function () {
          spalni_link();
        });
      });
    };



  }

  app.init = function () {
    fallbacks();
    visual();
  }

  // Call the init handler on document ready. Put the js logic in the function above
  $(function () {
    app.init();
  });

  return app;
}({}, jQuery));
