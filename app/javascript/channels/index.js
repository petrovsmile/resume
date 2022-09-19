//= require actioncable
//= require_self
//= require channels/joystick.js


(function() {
  this.App = {};

  App.cable = ActionCable.createConsumer();

}).call(this);