var array = []

$(function () {
    $("#datepicker").datepicker()
    $("#datepicker").datepicker('option', 'beforeShowDay', excludeDates)
    //$('#datepicker').datepicker('option', 'dateFormat', 'dd-mm-yy');

    $('#datepicker1').datepicker()
    $("#datepicker1").datepicker('option', 'beforeShowDay', excludeDates)
    $("#datepicker").datepicker("option", "language", "fr");
    $("#datepicker1").datepicker("option", "language", "fr");

    $.getJSON("/Produit/GetJSONDateOccupees/" + $('#idProduit').val(), function (data) {
        $.each(data, function (idx, date) {
            array.push(date)
        })

    });
});

function excludeDates(date) {
    var string = jQuery.datepicker.formatDate('m/d/yy', date);
    return [$.inArray(string,array) == -1]
};