// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap/bootstrap
//= require_tree .

$(document).ready(function(){

	$('#myModal').modal({
		show: false
	});

	$('.audience').on('keyup', function(){
		var letter = $(this).val();
		var firstlet = letter[0];
		console.log(firstlet);
		if (firstlet == 'a' || firstlet == 'e' ){
			$('#vowelchange').text('As an');
		} else {
			$('#vowelchange').text('As a');
		}
	});

	$('#story_estimate').change(function(){
		var estimate = $(this).val();
		console.log(estimate);
		if (estimate == 'taster') {
			$('.value').val(2);
		} else if (estimate == 'pint'){
			$('.value').val(4);
		} else if (estimate == 'growler'){
			$('.value').val(8);
		} else if (estimate == 'keg'){
			$('.value').val(20);
		}

	});

});

