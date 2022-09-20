(function() {
  App.cable.subscriptions.create({ channel: "JoystickChannel" }, {
    connected: function() {
      console.log('connected');
    },
    received: function(data) {
      console.log('received');
      console.log(data);
    },
  });

}).call(this);