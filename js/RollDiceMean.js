(function($) {
    $(document).ready(function() {
	
	$('#RollDiceMean').scianimator({
	    'images': ['images/RollDiceMean1.png', 'images/RollDiceMean2.png', 'images/RollDiceMean3.png', 'images/RollDiceMean4.png', 'images/RollDiceMean5.png', 'images/RollDiceMean6.png', 'images/RollDiceMean7.png', 'images/RollDiceMean8.png', 'images/RollDiceMean9.png', 'images/RollDiceMean10.png'],
	    'width': 480,
	    'delay': 500,
	    'loopMode': 'loop'
	});
	$('#RollDiceMean').scianimator('play');
    });
})(jQuery);
