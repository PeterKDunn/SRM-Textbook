(function($) {
    $(document).ready(function() {
	
	$('#BoxplotKrill').scianimator({
	    'images': ['images/BoxplotKrill1.png', 'images/BoxplotKrill2.png', 'images/BoxplotKrill3.png', 'images/BoxplotKrill4.png', 'images/BoxplotKrill5.png', 'images/BoxplotKrill6.png'],
	    'width': 500,
	    'delay': 500,
	    'loopMode': 'loop'
	});
	$('#BoxplotKrill').scianimator('play');
    });
})(jQuery);
