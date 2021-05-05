(function($) {
    $(document).ready(function() {
	
	$('#Draw15Cards').scianimator({
	    'images': ['images/Draw15Cards1.png', 'images/Draw15Cards2.png', 'images/Draw15Cards3.png', 'images/Draw15Cards4.png', 'images/Draw15Cards5.png', 'images/Draw15Cards6.png', 'images/Draw15Cards7.png', 'images/Draw15Cards8.png', 'images/Draw15Cards9.png', 'images/Draw15Cards10.png', 'images/Draw15Cards11.png', 'images/Draw15Cards12.png', 'images/Draw15Cards13.png', 'images/Draw15Cards14.png', 'images/Draw15Cards15.png', 'images/Draw15Cards16.png', 'images/Draw15Cards17.png', 'images/Draw15Cards18.png'],
	    'width': 300,
	    'delay': 1000,
	    'loopMode': 'loop',
 'controls': ['first', 'previous', 'play', 'next', 'last', 'loop', 'speed']
	});
	$('#Draw15Cards').scianimator('play');
    });
})(jQuery);
