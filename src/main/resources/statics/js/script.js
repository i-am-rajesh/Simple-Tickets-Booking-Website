$(document).ready(function() {
    $("#bookTicket").on("submit", function(event) {
        event.preventDefault(); 
		var url = baseURL + "bookTicket";
        var formData = $("#bookTicket").serialize(); 
        $.ajax({
            url: url, 
            type: "POST",
            data: formData,
            success: function(response) {
				let res = JSON.parse(response);
                if (res.status == "success") {
					  alert('Booking confirmed.');
					   $("#bookTicket")[0].reset();
                } else {	
                    alert('Booking failed.');
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                alert('Booking error.');
            }
        });
    });
});
