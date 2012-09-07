$(document).ready(function(){

    $('#search_options a').click(function(){

        $('#search_target').text($(this).text());
        $('#search_form').attr('action',$(this).attr('rel'));
        $('#search_name').attr('name',$(this).attr('attr'));
        $('body').click();
        return false;
    });
    if($('#slides .dashboardblock').length>4) {
        //divide slides to groups of 4
        var i=0;
        for(i=0;i<$('#slides .dashboardblock').length/4;i++) {
            $('#slides .dashboardblock').slice(i*4,(i*4)+4).wrapAll('<div class="slide"></div>').parent().append('<div class="clear"></div>');
        }
       $('#slides').slides({
            generatePagination: true,
            generateNextPrev: false,
            container:'dashrow',
            paginationClass:'slides_pagination',
            start: 1
        });
    }
    
});

