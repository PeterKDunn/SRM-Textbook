(function($) {
    $(document).ready(function() {
	
	$('#RollDiceMeanHist').scianimator({
	    'images': ['images/RollDiceMeanHist1.png'],
	    'width': 480,
	    'delay': 25,
	    'loopMode': 'loop',
 'controls': ['first', 'previous', 'play', 'next', 'last', 'loop', 'speed']
	});
	$('#RollDiceMeanHist').scianimator('play');
    });
})(jQuery);
