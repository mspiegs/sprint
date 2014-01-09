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
$(window).unload(function(){ $(window).unbind('unload'); });
$(document).ready(function(){

	$('.items > ul').find('li:first').addClass('roundedtop');
	$('.items > ul').find('li:last').addClass('roundedbottom');
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

	$('.hoveritem').on('click', function(){
		$(this).addClass('highlight');
		var id = $(this).data('story-id');

		$.getJSON('/stories/' + id, function(response){
			var letter = response.audience[0];
			if (letter == 'a' || letter == 'e' || letter == 'i' || letter == 'o') {
				intro = 'As an ';
			} else {
				intro = 'As a ';
			}
			var item = $('<div></div>');
			$('<p style=\"font-family: Georgia;\"><a href=\"/stories/'+response.id+'\">'+intro+'<span>'+response.audience+'</span>'+' I want '+'<span>'+response.want+'</span>'+' so that I '+response.because+'</a></p>').appendTo(item);
			$('.hoverviewitem').html(item);
		});
		$(this).find('div').show();
	});
	$('.hoveritem').on('mouseleave', function(){
		$(this).removeClass('highlight');
		$(this).children('div:last').hide();
	});

	// $('.hoverform').submit(function(){
	// 	var valuesToSubmit = $(this).serialize();
	// 		$.ajax({
	// 			type: 'POST',
	// 			url: $(this).attr('action'),
	// 			data: valuesToSubmit,
	// 			dataType: 'HTML'
	// 			success: function(){
	// 				window.reload();
	// 			}
	// 		return false;
	// 	});

});

