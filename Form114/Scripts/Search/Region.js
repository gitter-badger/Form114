$(function () {
    //var $region = $("#Region");
    var str = "";
    $.getJSON("/Search/ListeRegion/", function (data) {
        $.each(data, function (idx, item) {
            str += '<option value="' + item.id + '">' + item.name + '</option>';
        });
        $("#Region").html(str);
        $("#Region").change(loadPays);
    });
});

function loadPays() {
    var str = "";
    var Reg = $("#Region").val();
    $.getJSON("/Search/ListePays/" + Reg, function (data) {
        $.each(data, function (idx, dep) {
            str += '<option value="' + dep.id + '">' + dep.name + '</option>';
        });
        $("#Pays").html(str);
        $("#Pays").change(loadVille);
    });
}

function loadVille() {
    var str = "";
    var Pays = $("#Pays").val();

    $.getJSON("/Search/ListeVille1/" + Pays, function (data) {

        $.each(data, function (idx, dep) {


            str += '<option value="' + dep.id + '">' + dep.name + '</option>';

        });
        $("#Ville1").html(str);
        return false;
    });

}
