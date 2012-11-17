(function($) {

    $(document).ready(function() {
        $('.jeditable').each(function(elem) {
            var save_url = $(elem).attr('save');
            if (!save_url) {
                alert('jeditable element doesn\'t have a "save" attr!');
                return;
            }

            var edit_options = {
                tooltip: 'Click to edit...',
                cancel: 'Cancel',
                submit: 'Save',
            };

            if ($(elem).attr('indicator')) {
                edit_options['indicator'] = '/templates/nextgen_fatbox/img/loading-radar.gif';
            } else {
                edit_options['indicator'] = 'Saving...';
            }

            $(elem).editable(save_url, edit_options);
        });
    });

})(jQuery);
