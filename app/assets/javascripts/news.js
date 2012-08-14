/**
 * Created with JetBrains RubyMine.
 * User: robin
 * Date: 8/13/12
 * Time: 8:05 PM
 * To change this template use File | Settings | File Templates.
 */
$('input[name="news[release]"]').live('click', function () {
    if ($(this).hasClass('rs')) {
        if ($(this).val() == 1) {
            $("#news_push_datetime_input").show();
        }
        else {
            $("#news_push_datetime_input").hide();
        }
    }
})
