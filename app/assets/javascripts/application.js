// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .



$( document ).ready(function() {
$( '#myCarousel' ).carousel({ })
$('#myCarousel').on('slid.bs.carousel', function() {
});	
});

$(".dropdown-menu li a").click(function(){
  var selText = $(this).text();
  $(this).parents('.btn-group').find('.dropdown-toggle').html(selText+' <span class="caret"></span>');
});

$(function($){
  $('a').filter(function(){
    return $(this).attr('href').toLowerCase() === window.location.pathname.toLowerCase();
  }).addClass('active').css("background","#5F9EA0");
});
$(function($){
	$('.to-inactive').removeClass('active').css("background","#007fff");
});

$(document).ready( function (){
  $("#video_form").submit( function(submitEvent) {
		var filename = $("#file_input").val();
		var extension = filename.replace(/^.*\./, '');
		if (extension == filename) {
        extension = '';
    } else {
      extension = extension.toLowerCase();
    }
		switch (extension) {
      case 'mp4': submit();
      case 'flv': submit();
      case 'webm': submit();
      case '3gp': submit();
      case 'divx': submit();
      case 'amv': submit();
      case 'mkv': submit();
      default:
      	alert("Files with .mp4,.flv,.webm,.mkv,.3gp,.divx,.amv extension are allowed");
        submitEvent.preventDefault();
    }
  });
});


  function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#imag')
                    .attr('src', e.target.result)
                    .width(100)
                    .height(100);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
