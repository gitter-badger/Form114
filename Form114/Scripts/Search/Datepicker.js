var array = ["2015-08-27", "2015-08-28", "2015-08-29"]

$('input').datepicker({
    beforeShowDay: function (date) {
        var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
        return [array.indexOf(string) == -1]
    }
});
$(function () {
    $("#datepicker").datepicker({
        beforeShowDay: function (date) {
            var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
            return [array.indexOf(string) == -1]
        }
    });
    $("#datepicker1").datepicker();
});