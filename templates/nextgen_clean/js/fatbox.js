(function($) {

    $(document).ready(function() {
        $('.jeditable').each(function(index) {
            var save_url = $(this).attr('save');
            if (!save_url) {
                alert('jeditable element doesn\'t have a "save" attr!');
                return;
            }

            var edit_options = {
                tooltip: 'Click to edit...',
                cancel: 'Cancel',
                submit: 'Save',
            };

            if ($(this).attr('indicator')) {
                edit_options['indicator'] = '/templates/nextgen_fatbox/img/loading-radar.gif';
            } else {
                edit_options['indicator'] = 'Saving...';
            }

            $(this).editable(save_url, edit_options);
            $(this).append('<i class="icon-pencil"></i>');
        });
    });

})(jQuery);
