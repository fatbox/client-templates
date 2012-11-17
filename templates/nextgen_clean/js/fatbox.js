(function($) {

    $(document).ready(function() {
        $('.jeditable').each(function(index) {
            var self = this;
            var timeout = null;

            var save_url = $(self).attr('save');
            if (!save_url) {
                alert('jeditable element doesn\'t have a "save" attr!');
                return;
            }

            var add_pencil = function() {
                timeout = setTimeout(function() {
                    $(self).append('<i class="icon-pencil"></i>');
                }, 200);
            };
            var del_pencil = function() {
                $(self).children("i").remove();
            };

            var edit_options = {
                tooltip: 'Click to edit...',
                cancel: 'Cancel',
                submit: 'Save',
                onedit: del_pencil,
                onreset: add_pencil,
            };

            if ($(self).attr('indicator')) {
                edit_options['indicator'] = '/templates/nextgen_fatbox/img/loading-radar.gif';
            } else {
                edit_options['indicator'] = 'Saving...';
            }

            $(self).editable(save_url, edit_options);
            add_pencil();
        });
    });

})(jQuery);
