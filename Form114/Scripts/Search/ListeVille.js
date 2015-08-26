$(function () {
    var $marque = $("#Ville");
    var str = "";
    $.getJSON("/Search/ListeVille", function (data) {
        $.each(data, function (idx, item) {
            str += '<option name="Ville" value="' + item.id + '">' + item.name + '</option>';

        });
        $marque.html(str);
        $('.chosen-select').chosen();
        $('.chosen-select-deselect').chosen({ allow_single_deselect: true });
    });

});