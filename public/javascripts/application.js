$(function() {
 // Handler for .ready() called.

});


function findAddress(obj){
	var id = obj.attr('id');
  $.ajax({
    url: "/votes/"+id+"/find_user_address",
    type: 'GET',
    success: function(response) {
			$("#people_info").html(response);
    }
  });
}

function updateMobileNo(sr){
	url = $('#update_mob_form').attr('action');
  $.ajax({
    url: url,
    type: 'PUT',
		data: $('#update_mob_form').serialize(),
    success: function(response) {
			if (response == "success"){
				alert('Mobile No updated successfully');
			} else {
				alert('There were some problems in updating your mobile number, please try again');
			}
    }
  });
}
