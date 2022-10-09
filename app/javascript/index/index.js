//= require plugin/glightbox

$(document).ready(function(){
  var lightbox = GLightbox({});

  $('form input, form textarea').keyup(function(){
    $('.error_form_fields').slideUp();
  });

  $('form').submit(function(e){
    e.preventDefault();
    
    var have_empty_fields = false;

    $(this).find('input,textarea').each(function(){
      if ($(this).val().length == 0) {
        have_empty_fields = true;
      }
    });

    if (have_empty_fields == true) {
      $('.error_form_fields').slideDown();
    } else {
      $('form button').html('...');
      $.ajax({
        type     :'POST',
        cache    : false,
        async    : true,
        data: $(this).serialize(),
        url  : '/send_contact_form',
        success  : function(response) {
          $('.form_thanks').slideDown();
          $('form').slideUp();
        }
      });
    }
  });


});