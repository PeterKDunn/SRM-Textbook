(function($) {
    $(document).ready(function() {
	
	$('#RollDice').scianimator({
	    'images': ['images/RollDice1.png', 'images/RollDice2.png', 'images/RollDice3.png', 'images/RollDice4.png', 'images/RollDice5.png', 'images/RollDice6.png', 'images/RollDice7.png', 'images/RollDice8.png', 'images/RollDice9.png', 'images/RollDice10.png'],
	    'width': 350,
	    'delay': 500,
	    'loopMode': 'loop',
 'controls': ['first', 'previous', 'play', 'next', 'last', 'loop', 'speed']
	});
	$('#RollDice').scianimator('play');
    });
})(jQuery);
