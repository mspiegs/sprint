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
//= require jquery.ui.all
//= require jquery.turbolinks
//= require turbolinks
//= require bootstrap/bootstrap
//= require_tree .



$(document).ready(function(){
	dragdrop();
	clickspace();
	hiders();

	// Tabs background state
	$('#'+projid).addClass('active');
	
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

	$('#story_estimate, estimate').change(function(){
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

	

	$('.hoveritem').on('mouseenter', function(){
		$(this).find('.editbutton').show();
	});

	$('.hoveritem, .hoverview-background, .clickspace').on('mouseleave', function(){
		$(this).removeClass('highlight');
		$(this).find('.hoverview-background').hide();
		$(this).find('.editbutton').hide();
	});

	$('.cog, .cog-hover').click(function(){
		$('.cog-hover').toggle();
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


	// drag and drop
	
	

	
});

// Hide on document ready
var hiders = function(){
	$('.hoverview-background').hide();
	$('.editbutton').hide();
	$('.cog-hover').hide();
}
// Function for clicking on item and firing popover with story info
var clickspace = function(){ 
	$('.clickspace').on('click', function(){
		var id = $(this).closest('li').data('story-id');

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
		$(this).closest('li').find('div').show();
	});
}

// Function for drag and drop
var sortit = function(){
	$('.sortable').sortable();
	$('.sortable').disableSelection();
}
var dragdrop = function(){

	$('.draggable').draggable({ 
		connectToSortable: ".sortable",
		cursor: "move", 
		opacity: 0.7
		});
	$('.droppable').droppable({
		drop: function(event, ui){
			var dropstatus = $(this).data('drop-status');
			var storyid = $(ui.draggable).data('story-id');
			var url = '/stories/'+storyid+'.json';
			
			$.ajax({
				type: "PUT",
				dataType: "JSON",
				url: url,
				data: { story: { status: dropstatus}},
				success: function(data){
						console.log(data.story.project_id )
						$("#backlog-items").html(data.backlog_div);
						$("#commit-items").html(data.committed_div);
						$("#started-items").html(data.started_div);
						$("#qa-items").html(data.qa_div);
						$(ui.draggable).hide();
				},
				error: function(){
					alert(XMLHttpRequest.responseText);
				}
			});
			event.stopPropagation();
			event.preventDefault();
		}
	});
	}

