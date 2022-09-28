var car;

$(document).ready(function(){

  car = $('.car');

  $(document).keydown(function(e){    
    if ( e.keyCode ==37 ) {
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
    if ( e.keyCode ==38 ) {
      if (move == false) {
        move = true;
        direction = 'forward';
        drive();
      }
    }
    if ( e.keyCode ==39 ) {
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
    if ( e.keyCode ==40 ) {
      if (move == false) {
        move = true;
        direction = 'backward';
        drive();
      }
    }
  });

  $(document).keyup(function(e){    
    if ( e.keyCode ==37 ) {
      rotate = false;
    }
    if ( e.keyCode ==38 ) {
      move = false;
    }
    if ( e.keyCode ==39 ) {
      rotate = false;
    }
    if ( e.keyCode ==40 ) {
      move = false;
    }
  });

});

var direction;
var angle = 0;
var speedForward = 2;
var speedBackward = 1;
var speedRotate = 1;

var rotate = false;
var move = false;

function rotateRight(){
  if ( move == true ) {
    angle = angle + speedRotate;

    if ( angle > 360 ){
      angle = 0;
    }
  }

  if (rotate == true) {
    setTimeout(function(){
      rotateRight();
    });
  }
}

function rotateLeft(){
  if ( move == true ) {
    angle = angle - speedRotate;

    if ( angle < 0 ){
      angle = 360;
    }
  }

  if (rotate == true) {
    setTimeout(function(){
      rotateLeft();
    });
  }
}


function drive(){

  var nowX = parseFloat(car.css('left'));
  var nowY = convertPosY( parseFloat(car.css('top')) );
  
  var newX = nowX;

  

  if (direction == 'forward') {
    var newX = nowX + speedForward * Math.sin(angle * Math.PI / 180);
    var newY = nowY + speedForward * Math.cos(angle * Math.PI / 180);
  }
  if (direction == 'backward') {
    var newX = nowX - speedBackward * Math.sin(angle * Math.PI / 180);
    var newY = nowY - speedBackward * Math.cos(angle * Math.PI / 180);
  }
  
  if( newY > 0) {
    car.css('left', newX);
    car.css('top', convertPosY(newY));
    car.css('transform','rotate(' + angle + 'deg)');
  }
  

  if (move == true) {
    setTimeout(function(){
      drive();
    });
  }
}


function convertPosY(y){
  return $(window).height() - y;
}