$(function () {
    $('div.comment-container').comment({
        title: 'Commentaires',
        url_get: '../GetCommJSON/'+$('#IdProduit').val(),
        url_input: '../AjouterCommentaire',
        url_modify: '../ModifierCommentaire',
        url_delete: '../RetirerCommentaire',
        limit: 10,
        auto_refresh: false,
        refresh: 10000,
        transition: 'slideToggle',
    });
});