//= require jquery
//= require jquery_ujs

$(document).ready(function(){

  $(document).keydown(function(e) {
    var buttonCode;
    
    if ( e.keyCode ==37 ) {
      buttonCode = 'left';
    }
    if ( e.keyCode ==38 ) {
      buttonCode = 'up';
    }
    if ( e.keyCode ==39 ) {
      buttonCode = 'right';
    }
    if ( e.keyCode ==40 ) {
      buttonCode = 'down';
    }

    if ( buttonCode != undefined ) {
      sendButtonEvent(buttonCode+'Down');
    }
  });

  $(document).keyup(function(e) {
    var buttonCode;
    
    if ( e.keyCode ==37 ) {
      buttonCode = 'left';
    }
    if ( e.keyCode ==38 ) {
      buttonCode = 'up';
    }
    if ( e.keyCode ==39 ) {
      buttonCode = 'right';
    }
    if ( e.keyCode ==40 ) {
      buttonCode = 'down';
    }

    if ( buttonCode != undefined ) {
      sendButtonEvent(buttonCode+'Up');
    }
  });

  $('button').mousedown(function() {
    sendButtonEvent($(this).attr('id')+'Down');
  });

  $('button').mouseup(function() {
    sendButtonEvent($(this).attr('id')+'Up');
  });

  function sendButtonEvent(buttonCode) {
    $.ajax({
      type     :'POST',
      cache    : false,
      async    : true,
      data: {
        buttonCode: buttonCode,
      },
      url  : '/joystick/event',
      success  : function(response) {
        console.log(response);
      }
    });
  }
  

});