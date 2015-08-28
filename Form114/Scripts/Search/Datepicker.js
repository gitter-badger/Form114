var array = []

$(function () {
    $('#datepicker').datepicker({
        beforeShowDay: excludeDates,
        language: "fr"
    })

    $('#datepicker1').datepicker({
        beforeShowDay: excludeDates,
        language: "fr"
    })


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