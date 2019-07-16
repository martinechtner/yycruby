window.growlAlerts = (opts = {}) ->
  $.notify { message: opts['message'] },
    { #settings
      element: 'body',
      position: null,
      type: opts['type'],
      allow_dismiss: true,
      placement: {
        from: 'top',
        align: opts['align'] ?= 'right'
      },
      offset: 20,
      spacing: 10,
      z_index: 1031,
      delay: 5000,
      timer: opts['timer'] ?= 1000,
      mouse_over: null,
      animate: {
        enter: 'animated fadeInDown',
        exit: 'animated fadeOutUp'
      },
      icon_type: 'class',
      template: '<div data-notify="container" class="col-11 col-sm-3 alert alert-{0}" role="alert">' +
        '<button type="button" aria-hidden="true" class="close" data-notify="dismiss">×</button>' +
        '<span data-notify="message">{2}</span>' +
        '</div>' +
        '</div>'
      }
