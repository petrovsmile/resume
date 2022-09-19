(function() {
  App.comments = App.cable.subscriptions.create({ channel: "JoystickChannel", room: 'joystick' }, {
    connected: function() {
      console.log('connected');
    },
    received: function(data) {
      console.log('received');
      console.log(data);
    },
  });

}).call(this);