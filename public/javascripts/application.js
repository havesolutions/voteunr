$(function() {
 // Handler for .ready() called.

});


function findAddress(sr_no){
	var sr_no = sr_no.html();
  $.ajax({
    url: "/votes/"+sr_no+"/find_user_address",
    type: 'GET',
    data: '',//$("#query_form").serialize(),
    success: function(response) {
			$("#people_info").html(response);
    }
  });
}
