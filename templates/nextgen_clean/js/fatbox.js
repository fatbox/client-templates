(function($) {
    $(document).ready(function() {
        var jeditable_indicator_preloaded = false;

        $('.jeditable').each(function(index) {
            var self = this;
            var timeout = null;

            // all jeditable elements must have a 'save' attribute
            // that points to the URL we should post the update to
            var save_url = $(self).attr('save');
            if (!save_url) {
                alert('jeditable element doesn\'t have a "save" attr!');
                return;
            }

            // helper functions for adding and removing some visual
            // eye candy in the form of a pencil, to better call out
            // the editable elements
            var add_pencil = function() {
                timeout = setTimeout(function() {
                    $(self).append('<i class="icon-pencil"></i>');
                }, 200);
            };
            var del_pencil = function() {
                $(self).children("i").remove();
            };

            // now build the jeditable options
            var edit_options = {
                tooltip: 'Click to edit...',
                cancel: 'Cancel',
                submit: 'Save',
                onedit: del_pencil,
                onreset: add_pencil,
                callback: add_pencil,
            };

            // if the element contains an 'indicator' element then use
            // a indicator gif while saving
            if ($(self).attr('indicator')) {
                edit_options['indicator'] = '<img src="/templates/nextgen_fatbox/img/loading-radar.gif">';

                // preload the gif so it's ready when we need it
                if (jeditable_indicator_preloaded == false) {
                    $('<img/>')[0].src = "/templates/nextgen_fatbox/img/loading-radar.gif";
                    jeditable_indicator_preloaded = true;
                }
            } else {
                edit_options['indicator'] = 'Saving...';
            }

            // setup the element
            $(self).editable(save_url, edit_options);
            add_pencil();
        });
    });

})(jQuery);
