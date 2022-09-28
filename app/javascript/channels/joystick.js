(function() {
  var joystick_hash = $('input[name="joystick_hash"]').val();
  App.cable.subscriptions.create({ channel: "JoystickChannel", joystick_channel: joystick_hash }, {
    connected: function() {
      console.log('connected');
    },
    received: function(data) {
      console.log('received');
      console.log(data);

      if ( data['buttonCode'] == 'leftDown' ) {
        if (rotate == false) {
          rotate = true;
          if (direction == 'forward') {
            rotateLeft();
          }
          if (direction == 'backward') {
            rotateRight();
          }
        }
      }
      if ( data['buttonCode'] == 'upDown' ) {
        if (move == false) {
          move = true;
          direction = 'forward';
          drive();
        }
      }
      if ( data['buttonCode'] == 'rightDown' ) {
        if (rotate == false) {
          rotate = true;
          if (direction == 'forward') {
            rotateRight();
          }
          if (direction == 'backward') {
            rotateLeft();
          }
        }
      }
      if ( data['buttonCode'] == 'downDown' ) {
        if (move == false) {
          move = true;
          direction = 'backward';
          drive();
        }
      }


      if ( data['buttonCode'] == 'leftUp' ) {
        rotate = false;
      }
      if ( data['buttonCode'] == 'upUp' ) {
        move = false;
      }
      if ( data['buttonCode'] == 'rightUp' ) {
        rotate = false;
      }
      if ( data['buttonCode'] == 'downUp' ) {
        move = false;
      }

    },
  });
}).call(this);