$(document).ready(function () {

    $('.expan, .ex, .corr, .reg').hide(); /* Interventi editoriali inizialmente nascosti */

    /* Gestione pulsanti categorie + colorazione testo */
    $('.categ').click(function () {
        $(this).toggleClass('active');
        $btnId = $(this).attr('id');
        $color = $(this).css('background');
        if ($(this).hasClass('active')) {
            $(this).css('box-shadow', '0.5px 0.5px 10px red');
            $(this).css('transition', '0.3s ease');
            $('span.' + $btnId).css('background-color', $color);
        } else {
            $(this).css('box-shadow', '0.5px 0.5px 2px grey');
            $(this).css('transition', '0.3s ease');
            $('span.' + $btnId).css('background-color', 'transparent');
        }
    });

    /* Gestione pulsanti interventi + colorazione testo */
    $('.int').click(function () { 
        $(this).toggleClass('active');
        $btnId = $(this).attr('id');
        $color = $(this).css('background');
        if ($(this).hasClass('active')) {
            $(this).css('box-shadow', '0.5px 0.5px 10px red');
            $(this).css('transition', '0.3s ease');
            $('span.' + $btnId).show();
            $('span.' + $btnId).css('background-color', $color);
        } else {
            $(this).css('box-shadow', '0.5px 0.5px 2px grey');
            $(this).css('transition', '0.3s ease');
            $('span.' + $btnId).hide();
        }
    });

    $("span.person, span.character, span.bibl, span.place, span.event, span.org").mouseover(function(){ 
        $(this).css("text-decoration", "underline");
        $(this).css("cursor", "pointer");
        $(this).next("span.info").css("visibility", "visible");
    });
    $("span.person, span.character, span.bibl, span.place, span.event, span.org").mouseout(function(){ 
        $(this).css("text-decoration", "none");
        $(this).next("span.info").css("visibility","hidden");
    });

    $("span.cit").mouseover(function(){ 
        $(this).next("span.info").css("visibility", "visible");
    });
    $("span.cit").mouseout(function(){ 
        $(this).next("span.info").css("visibility","hidden");
    });

});
