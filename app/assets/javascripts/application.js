// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require owl.carousel.min
//= require jquery.matt.notification
//= require turbolinks
//= require_tree .
//= stub rails_admin/custom/ui.js
//= stub 'ie'

$(document).on('turbolinks:load', init);

function init() {
    // navbar-main dropdown
    $('.navbar-main li.dropdown').hover(function() {
        $(this).addClass('open').find('.dropdown-menu').stop(true, true).delay(200).fadeIn(100);
    }, function() {
        $(this).removeClass('open').find('.dropdown-menu').stop(true, true).delay(200).fadeOut(100);
    });
    // menu root active
    $('.navbar-main').find('.dropdown-menu').each(function(){
        if($(this).find('a.active').length > 0){
            $(this).parent().find('.dropdown-toggle').addClass('active');
        }
    });

    /**
     * main carousel
     */
    $('.mainCarousel.active').owlCarousel({
        items: 1,
        nav: false,
        dots: true,
        loop: true,
        autoplay: true
    });

    /**
     * carousel property
     */
    $('.carouselProperty.active').owlCarousel({
        items: 1,
        nav: false,
        dots: true,
        loop: true,
        autoplay: true
    });

    /**
     * property zoombox
     */
    $('a.zoombox').zoombox();
};