$(function () {
    $('.img1').click(function () {
        var s = "../Produit/Details/" + $(this).find('.idProduit').html()
        window.location = s
    })

    $('.FormSubmitButton').click(function () {
        console.log($(this).find('#IdRegion').val())
        //$('#idCurrentPage').val($(this).html());
        $(this).find('#IdFormPagination').submit();
        return false;
    });
})