function bulk_widget(el) {
    var ids = $('.idchecker:checked').serialize();
    if(ids=='') {
        return false;
    }

    window.location = $(el).attr('href')+'&'+ids;
    return false;
}
function c_all(el) {
    if($(el).is(':checked')) {
        $('.idchecker').not(':disabled').attr('checked','checked').parents('tr').addClass('shownice');
        $.getJSON('?cmd=clientarea&action=domains&make=widgetsget&'+$('.idchecker').serialize(),{},function(data){
            $('.icons li').addClass('disabled');
            $('.icons li.widget_domainrenewal').removeClass('disabled');
            $.each(data.resp, function(index, i) {
                $('.icons li.widget_'+i.widget).removeClass('disabled');
            });

        });
    } else {
        $('.idchecker').not(':disabled').removeAttr('checked').parents('tr').removeClass('shownice');
        $('.icons li').addClass('disabled');
    }

}
function c_unc(el) {
    var v=$(el);
    if(v.is(':checked')) {
        v.parents('tr').eq(0).addClass('shownice');
    } else {
        v.parents('tr').eq(0).removeClass('shownice');
    }

    var ids = $('.idchecker:checked').serialize();
    $('.icons li').addClass('disabled');
    if(ids=='') {
        return;
    }
    $.getJSON('?cmd=clientarea&action=domains&make=widgetsget&'+ids,{},function(data){
        $('.icons li').addClass('disabled');
        $('.icons li.widget_domainrenewal').removeClass('disabled');
        $.each(data.resp, function(index, i) {
            $('.icons li.widget_'+i.widget).removeClass('disabled');
        });

    });
}