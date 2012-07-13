var cansearch=true;
var loaders = new Array;
function appendLoader(loadername) {
    loaders[loaders.length]=loadername;
}
$.extend($.fn, {
    slideToElement: function(target) {
        var $target = $('a[name=' + target +']');
        if ($target.length) {
            var targetOffset = $target.offset().top;
            $('html,body').animate({
                scrollTop: targetOffset-100
            }, 500,'linear',function(){});
            return false;
        }
    },
    addLoader: function() {
        var totalWidth=$(this).width();
        var totalHeight=$(this).height();
        totalWidth += parseInt($(this).css("padding-left"), 10) + parseInt($(this).css("padding-right"), 10);
        totalHeight += parseInt($(this).css("padding-top"), 10) + parseInt($(this).css("padding-bottom"), 10);
        if ($('#preloader').length>0) {
            $('#preloader').css({
                width:totalWidth+'px',
                height:totalHeight+'px'
            });
            $('#preloader').show();
        } else {
            var cont='<div id="preloader" style="position:absolute;top:'+$(this).position().top+'px;left:'+$(this).position().left+'px;width:'+totalWidth+'px;height:'+totalHeight+'px;"></div> ';
            $(this).append(cont);
        }
    },
    TabbedMenu: function(o) {
        var el = o!=undefined && o.elem!=undefined ? o.elem: '.tabb';
        var num = o!=undefined &&  o.num!=undefined ? o.num : 0;
        $(el).hide();
        $(el).eq(num).show();
        $('a.tchoice').eq(num).addClass('picked');

        $(this).find('a.tchoice').each(function(n){
            $(this).click(function(){
                $(el).hide();
                $(el).eq(n).show();
                $('a.tchoice').removeClass('picked');

                $(this).addClass('picked');

                return false;

            });

        });

        return( $(this) );

    },
    ajaxHint:function() {

        $(this).each( function() {
            $(this).keyup(function(){
                if (cansearch) {


                    if ($(this).val()!='' && $(this).val()!=' ') {
                        cansearch=false;
                        $.post('?cmd=tickets&action=kbhint',{
                            query:$(this).val()
                        },function(data){
                            cansearch=true;
                            var resp = parse_response(data);
                            if (resp!==false && typeof(resp)=='string' && resp!='') {
                                $('#hintarea').html(resp);
                                if (!$('#hintarea').is(':visible')) {
                                    $('#hintarea').slideDown();
                                }
                            }
                        });
                    } else {
                        $('#hintarea').slideUp('fast',function(){
                            $(this).html('');
                        });
                    }
                }
            });
        });

    }

});
function isEmpty(obj) {
    for(var prop in obj) {
        if(obj.hasOwnProperty(prop))
            return false;
    }

    return true;
}

function ajax_update(url,params,update,swirl) {
    if (swirl)
        $(update).html('<center><img src="ajax-loading.gif" /></center>');

    if(params != undefined && isEmpty(params)) {
        params = {
            empty1m:'param'
        };
    }
    $.post(url, params, function(data){

        var resp = parse_response(data);
        if (!resp) {
            $(update).html('');
            return false;
        }
        else {

            $(update).html(resp);
        }

    });

}

function parse_response(data){

    if (data.indexOf('<!-- {')!=0)
        return false;

    var codes = eval('(' + data.substr(data.indexOf('<!-- ')+4, data.indexOf('-->')-4) + ')');
    // alert(codes.ERROR);
    var i=0;

    for(i=0;i<codes.ERROR.length;i++) {
        $('#errors .alert').append('<span >'+codes.ERROR[i]+'</span>');
    }

    for(i=0;i<codes.INFO.length;i++) {
        $('#infos .alert').append('<span >'+codes.INFO[i]+'</span>');
    }
    if ($('#errors').find('span').length>0) {
        $('#errors .alert').show();
        $('#errors').slideDown();
        reBind();
    }
    if ($('#infos').find('span').length>0) {
        $('#infos .alert').show();
        $('#infos').slideDown();
        reBind();
    }
    return data.substr(data.indexOf('-->')+3, data.length);


}

function reBind() {
    $('.close').unbind('click');
    $('.close').click(function(){
        $(this).parent().fadeOut('fast',function(){
            $(this).find('span').remove();
        });
        return false;
    });

}
$(document).ready(function(){
    function CSRFProtection(xhr) {
        var token = $('meta[name="csrf-token"]').attr('content');
        if (token) xhr.setRequestHeader('X-CSRF-Token', token);
    }
    if ('ajaxPrefilter' in $) $.ajaxPrefilter(function(options, originalOptions, xhr){
        CSRFProtection(xhr)
    });
    else $(document).ajaxSend(function(e, xhr){
        CSRFProtection(xhr)
    });
    $('#langchange ul').hover(function(){
        $(this).addClass('show');
    },function(){
        $(this).removeClass('show');
    });

   $(".vtip_description").tooltip();
    $('.sh1a .orderboxpadding').click(function(){
        var e=$(this).parent().find('.subdesc_').eq(0);
        if ($(e).is(':visible')) {
            $(e).hide();
        } else {
            $(e).show();
        }
    });

    $("a.sortorder").click(function(){
        $('#updater').addLoader();
        $('#checkall').attr('checked',false);
        $('#currentlist').attr('href',$(this).attr('href')) ;
        $('a.sortorder').removeClass('asc');
        $('a.sortorder').removeClass('desc');
        if ($(this).attr('href').substring($(this).attr('href').lastIndexOf('|'))=='|ASC') {
            $(this).addClass('asc');
            $(this).attr('href',$(this).attr('href').substring(0,$(this).attr('href').lastIndexOf('|'))+'|DESC');
        }
        else {
            $(this).addClass('desc');
            $(this).attr('href',$(this).attr('href').substring(0,$(this).attr('href').lastIndexOf('|'))+'|ASC');
        }


        ajax_update($('#currentlist').attr('href'),{
            page:$('#currentpage').val(),
            layer:'ajax'
        },'#updater');
        return false;
    });

    $('#pageswitch button').click(function(){
        var p = parseInt($(this).text())-1;
        $('#currentpage').val(p).change();
    });
    $('#currentpage').change(function(){
        $('#updater').addLoader();
        $('#checkall').attr('checked',false);
        ajax_update($('#currentlist').attr('href'),{
            page:$('#currentpage').val(),
            layer:'ajax'
        },'#updater');
    });

    $('.submiter').click(function(){
        $('#updater').addLoader();
        $('#checkall').attr('checked',false);
        var pushs='';
        if ($(this).attr('queue'))
            pushs='push';
        ajax_update($('#currentlist').attr('href')+'&'+$('#testform').serialize()+'&'+$(this).attr('name'),{
            layer:'ajax',
            stack:pushs
        },'#updater');
        return false;
    });

    reBind();

    $('#ticketmessage').ajaxHint();

    setTimeout(function(){

        if ($('#errors').find('span').length>0) {
            $('#errors').slideDown();
        }
        if ($('#infos').find('span').length>0) {
            $('#infos').slideDown();
        }
    }, 30);

    if (loaders.length>0) {
        var i=0;
        for (i=0;i<loaders.length;i++) {
            if(loaders[i]=='flyingSidemenu')
                continue;
            eval(loaders[i]+'()');
        }
    }
    (function($){
        var e=0;
        var w=100;
        var u = $('.pa1 a','#submenu');
        var l = u.length;
        u.each(function(o){
            if(e==0 && $(this).width()+$(this).position().left>960) {
                e=o;
            }
            if($(this).width()>w)
                w=$(this).width();
        });
        if(e>0) {
            var d= $('<ul class="dropdown-menu"></ul>');

            var a=$('<a class="dropdown-toggle" data-toggle="dropdown" href="#"></a>').text('More').append($('<b class="caret"></b>'));
            var more = $('<li class="dropdown"></li>').append(a);
            for(i=l;i>=e;i--) {
                d.prepend(u.eq(i));
            }
            more.append(d);
            $('.pa1','#submenu').append(more);

        }

    })(jQuery);


    var $win = $(window)
    , $nav = $('#mainmenu')
    , navTop = $('#mainmenu').length && $('#mainmenu').offset().top
    , isFixed = 0

    processScroll();
    wrapIcons();
    $win.on('scroll', processScroll);
    if($('#cart').length && $('#sidemenu').length && $('#floater').length)
        $win.on('scroll', processScroll2);

    function processScroll() {
        var i, scrollTop = $win.scrollTop()
        if (scrollTop >= navTop && !isFixed) {
            isFixed = 1
            $nav.addClass('nav-fixed')
        } else if (scrollTop <= navTop && isFixed) {
            isFixed = 0
            $nav.removeClass('nav-fixed')
        }


    }
    function processScroll2() {
        var t=$(window).scrollTop()-$('#sidemenu').offset().top;
        var maxi  =$('#cart').height()-$('#floater').height()-15;
        if(t>maxi)
                t=maxi;
        if(t<0)
                t=0;
         if($('#mainmenu').hasClass('nav-fixed'))
             t+=60;
        $('#floater').animate({top:t+"px" },{queue: false, duration: 300});
    }


    $('#mainmenu .dropdown-menu button.btn').click(function(){
        if($(this).attr('href'))
            window.location=$(this).attr('href');
    });


function clearMenus(o) {
    $(o).parent().children(".dropdown-menu").stop(false, true).slideUp('fast').parent().removeClass('open');
}
$("#mainmenu .dropdown-toggle").live({
    mouseenter: function () {
        $(this).parent().addClass('open').children(".dropdown-menu").slideDown('fast'); /* var li = $(this).parent('li') , isActive = li.hasClass('open'); !isActive && li.toggleClass('open'); */
    },
    mouseleave: function () {
        var o = this;
        var timeoutId = setTimeout(function () {
            clearMenus(o)
        }, 50);
        $('.dropdown-menu', this.parent).data('timeoutId', timeoutId);
    }
}).unbind('click').click(function(e){e.stopPropagation();return true;});
$(".dropdown-menu", "#mainmenu li.dropdown").live({
    mouseenter: function () {
        clearTimeout($(this).data('timeoutId'));
    },
    mouseleave: function () {
        clearMenus(this);
    }
});
     
});


function wrapIcons() {
    var v=$.browser.version.substring(0,$.browser.version.indexOf('.'));

    // IE7 support
    if ($.browser.msie && v=="7")
    {
        // Icons replacement map
        var iconMap = {
            'phone':		'!',
            'mobile':		'"',
            'tag':			'#',
            'directions':	'$',
            'mail':			'%',
            'pencil':		'&',
            'paperclip':	'\'',
            'reply':		'(',
            'replay-all':	')',
            'forward':		'*',
            'user':			'+',
            'users':		',',
            'add-user':		'-',
            'card':			'.',
            'extract':		'/',
            'marker':		'0',
            'map':			'1',
            'compass':		'2',
            'arrow':		'3',
            'target':		'4',
            'path':			'5',
            'heart':		'6',
            'star':			'7',
            'like':			'8',
            'chat':			'9',
            'speech':		':',
            'quote':		';',
            'printer':		'<',
            'bell':			'=',
            'link':			'>',
            'flag':			'?',
            'gear':			'@',
            'flashlight':	'A',
            'cup':			'B',
            'price-tag':	'C',
            'camera':		'D',
            'moon':			'E',
            'palette':		'F',
            'leaf':			'G',
            'music-note':	'H',
            'bag':			'I',
            'plane':		'J',
            'buoy':			'K',
            'rain':			'L',
            'eye':			'M',
            'clock':		'N',
            'mic':			'O',
            'calendar':		'P',
            'lightning':	'Q',
            'hourglass':	'R',
            'rss':			'S',
            'wifi':			'T',
            'lock':			'U',
            'unlock':		'V',
            'tick':			'W',
            'cross':		'X',
            'minus-round':	'Y',
            'plus-round':	'Z',
            'cross-round':	'[',
            'minus':		'\\',
            'plus':			']',
            'forbidden':	'^',
            'info':			'_',
            'info-round':	'`',
            'question':		'a',
            'question-round':	'b',
            'warning':		'c',
            'redo':			'd',
            'undo':			'e',
            'swap':			'f',
            'revert':		'g',
            'refresh':		'h',
            'list':			'i',
            'list-add':		'j',
            'thumbs':		'k',
            'page-list':	'l',
            'page':			'm',
            'pages':		'n',
            'marker':		'0',
            'pictures':		'p',
            'movie':		'q',
            'music':		'r',
            'folder':		's',
            'drawer':		't',
            'trash':		'u',
            'outbox':		'v',
            'inbox':		'w',
            'download':		'x',
            'cloud':		'y',
            'cloud-upload':	'z',
            'play':			'{',
            'pause':		'|',
            'record':		'~',
            'forward':		'Ä',
            'backward':		'Å',
            'previous':		'Ç',
            'next':			'É',
            'expand':		'Ñ',
            'reduce':		'Ö',
            'volume':		'Ü',
            'loud':			'á',
            'mute':			'à',
            'left-fat':		'â',
            'down-fat':		'ä',
            'up-fat':		'ã',
            'right-fat':	'å',
            'left':			'ç',
            'down':			'é',
            'up':			'è',
            'right':		'ê',
            'left-round':	'ë',
            'down-round':	'í',
            'up-round':		'ì',
            'right-round':	'î',
            'home':			'ï',
            'ribbon':		'ñ',
            'read':			'ó',
            'new-tab':		'ò',
            'search':		'ô',
            'ellipsis':		'ö',
            'bullet-list':	'®',
            'creative-commons':	'©'
        };

      
        // Font-icons
        $('[class^="iconfont-"],[class*=" iconfont-"]').each(function(i)
        {
            // Icon class
            var name = /iconfont-([^ ]+)/.exec(this.className)[1],
            element = $(this);
            // If valid icon name
            if (iconMap[name])
            {
                // Create replacement
                element.prepend('<span class="font-icon'+(element.is(':empty') ? ' empty' : '')+'">'+iconMap[name]+'</span>');
            }
        });

     
      
    }

    // IE8 support
    if ($.browser.msie && parseInt(v)==8)
    {
        // Font-icons
        $('[class^="iconfont-"],[class*=" iconfont-"]').each(function(i)
        {
            // Empty elements
            var element = $(this);
            if (element.is(':empty'))
            {
                element.addClass('font-icon-empty');
            }
        });
    };

}
