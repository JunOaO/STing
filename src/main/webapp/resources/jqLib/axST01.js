$(function() {
	// ** JSON login 기능
	$('#loginf').click(function() {
		open('loginf',"_blank",
				"toolbar=no,member=yes,scrollbars=yes,resizeble=yes,width=400,height=500");
		}); //loginf
	
	$('#bjoinf').click(function() {
		open('bjoinf',"_blank",
				"toolbar=no,member=yes,scrollbars=yes,resizeble=yes,width=855,height=840");
		}); //bjoinf
		
	$('.class_reple_writer_profile').click(function() {
		var id = $(this).attr('alt');
		alert("되는감?");
		open('profiledetailf?id='+id,"_blank",
				"toolbar=no,member=yes,scrollbars=yes,resizeble=yes,width=855,height=840");
		}); //profileDetail
	
});//ready