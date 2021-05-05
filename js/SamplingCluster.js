(function($) {
    $(document).ready(function() {
	
	$('#SamplingCluster').scianimator({
	    'images': ['images/SamplingCluster1.png', 'images/SamplingCluster2.png', 'images/SamplingCluster3.png', 'images/SamplingCluster4.png'],
	    'width': 480,
	    'delay': 750,
	    'loopMode': 'loop'
	});
	$('#SamplingCluster').scianimator('play');
    });
})(jQuery);
