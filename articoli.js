$(document).ready(function () {

    $('.expan, .ex, .corr, .reg').hide(); /* Interventi editoriali inizialmente nascosti */

    /* Gestione pulsanti categorie + colorazione testo + pulsante Ripulisci */
    $('.categ').click(function () {
        $(this).toggleClass('active');
        $btnId = $(this).attr('id');
        $color = $(this).css('background');
        if ($(this).hasClass('active')) {
            $(this).css('box-shadow', '0.5px 0.5px 10px red');
            $(this).css('transition', '0.3s ease');
            $('span.' + $btnId).css('background', $color);
            $("button#clean").click(function () {
                $('button').css('box-shadow', '0.5px 0.5px 2px grey');
                $('span.person, span.character, span.bibl, span.place, span.event, span.org, span.num, span.date, span.verbum, span.cit, span.foreign').css('background', 'transparent');
            });
        } else {
            $(this).css('box-shadow', '0.5px 0.5px 2px grey');
            $(this).css('transition', '0.3s ease');
            $('span.' + $btnId).css('background', 'transparent');
        }
    });

    /* Gestione pulsanti interventi + colorazione testo + pulsante Ripulisci */
    $('.int').click(function () { 
        $(this).toggleClass('active');
        $btnId = $(this).attr('id');
        $color = $(this).css('background');
        if ($(this).hasClass('active')) {
            $(this).css('box-shadow', '0.5px 0.5px 10px red');
            $(this).css('transition', '0.3s ease');
            $('span.' + $btnId).show();
            $('span.' + $btnId).css('background', $color);
            $("button#clean").click(function () {
                $('button').css('box-shadow', '0.5px 0.5px 2px grey');
                $('span.ex, span.expan, span.corr, span.reg').hide();
            });
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

    $("span.cit, span.glossario").mouseover(function(){ 
        $(this).next("span.info").css("visibility", "visible");
    });
    $("span.cit, span.glossario").mouseout(function(){ 
        $(this).next("span.info").css("visibility","hidden");
    });

    /* Gestione area interattiva facsimile */
    var previousSpan = null;
    
    $("area").click(function() {
        var dataCorr = $(this).attr("data-corresp"); 
        if (dataCorr.startsWith("#")) {
            var spanId = dataCorr.substring(1); 
            var spanCorr = $("#" + spanId); 
            if (previousSpan && previousSpan.length > 0) {
                previousSpan.removeClass('selected');
            }
            if (spanCorr.length > 0) {
                spanCorr.addClass('selected');
                $('html, body').animate({
                    scrollTop: spanCorr.offset().top - 273
                }, 700);
                previousSpan = spanCorr;
            }
        }
    });

});
