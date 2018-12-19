/**
 * @author mvideaud
 */
jQuery(function($) {

    $.fn.notification = function(options) {
        $.extend({
            fixe	            :   false,
            type	            : 	"info",
            contenu             : 	"Ma super notification.",
            delai	            : 	7000
        }, options);

        var iconeBootstrap = null;
        var alertBootstrap = null;
        switch(options.type) {
            case 'success':
                iconeBootstrap = 'check';
                alertBootstrap = 'success';
                break;
            case 'error':
                iconeBootstrap = 'times';
                alertBootstrap = 'danger';
                break;
            default:
                iconeBootstrap = 'info';
                alertBootstrap = 'info';
                break;
        }

        var notification =	$('<div class="notification alert alert-'+alertBootstrap+' animated fadeInDown '+(options.fixe == true ? 'fixe' : '')+'">'+
        '<div class="container">'+
                '<div class="row">'+
                    '<div class="col-sm-1"><i class="fa fa-'+iconeBootstrap+'"></i></div>'+
                    '<div class="col-sm-11">'+
                            options.contenu+
                    '</div>'+
                '</div>'+
            '</div>'+
        '</div>');

        return this.each(function() {
            var self = $(this);
            //recherche si notifications existe
            var notifications = $('.notifications', self);
            // si absent -> injection
            if(notifications.length == 0){
                notifications = $('<div class="notifications animated" />');
                self.append(notifications);
            }
            // insertion de la notification
            notifications.append(notification);

            // ajout fermeture manuelle
            if(options.fixe == true) {
                $('body').prepend('<div class="modal-backdrop notif fade in" />');
                var close = $('<button class="close">&times;</button>');
                notification.find('.container').prepend(close);
                // fermer une notification au click
                close.click(function(e){
                    e.preventDefault();
                    fermer();
                });
            }
            else {
                // timer fermeture
                setTimeout(function () {
                    fermer();
                }, options.delai);
            }

            function fermer() {
                notification.addClass('fadeOutUp').delay(500).fadeOut(300, function(){
                    notification.remove();
                    $('.modal-backdrop').remove();
                    //fermeture div principale
                    setTimeout(function() {
                        if(notifications.is(':empty')) notifications.remove();
                    },1000);
                });
            }

        });

    };

    // exemple d'ajout ajout depuis une div
    $('.addNotif').click(function(e){
        e.preventDefault();
        $('header').notification({
            fixe	:   false,
            type	: 	"error",
            contenu : 	"Je suis une notification de test, je me ferme dans 5 secondes toute seule.",
            delai	: 	5000
        });
    });

});