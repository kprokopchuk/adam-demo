scrivito.on('content', function() {
    $('a.gallery').colorbox({ opacity: 0.5, rel: $(this).data('group'), photo: true });
});