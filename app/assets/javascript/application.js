//= require jquery
//= require jquery_ujs

$(document).ready(function(){
    $('.main_menu a').click(function(e){
        e.preventDefault();

        $('.main_menu li').removeClass('active');
        $(this).parent().addClass('active');

        scroll =  $('a[name="'+this.hash.replace("#","")+'"]').offset().top;
        $('html, body').stop().animate({ 'scrollTop': scroll }, 600);

        window.history.pushState(null, null, $(this).attr('href'));
    });

    $(window).scroll(function(){
      find_menu_active();
    });
    find_menu_active();
    
    function find_menu_active(){
      var active_block_name = 'hello';
      var active_block_name_now = $('.main_menu li.active a').attr('href').replace('/#','');

      $('.js-scroll-section').each(function(){
        var offset_top = $(this).offset().top;
        var scroll = $(window).scrollTop();
        var window_height = $(window).height();

        var position_percent_of_the_window = parseInt(((offset_top - scroll) / window_height) * 100);

        if (position_percent_of_the_window < 30){
          active_block_name = $(this).attr('name');
        }
      });

      if( active_block_name != active_block_name_now){
        $('.main_menu li').removeClass('active');
        $('.main_menu a[href*="'+active_block_name+'"]').parent().addClass('active');
      }
    }
    

    


});