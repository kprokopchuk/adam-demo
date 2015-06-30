scrivito.on('content', function() {
    if($('a.gallery').length > 0) {
        $('a.gallery').colorbox({ opacity: 0.5, rel: $(this).data('group'), photo: true });
    }
});