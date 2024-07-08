<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hdsoft.repository.*" %>
<% List<BusTicketBooking> tickets = (List<BusTicketBooking>) request.getAttribute("ticket"); %>

<!DOCTYPE html>
<html>
<head>
  <title>view bookings</title>
  <!-- Font Awesome for icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
  <!-- CSS -->
  <link href="<c:url value='/resources/css/viewTicket.css' />" rel="stylesheet">
  
   <!-- GETTING BASE URL -->
    <script type="text/javascript">
        var currentURL = "<%= request.getRequestURL() %>";

        var lastIndex = currentURL.lastIndexOf("/");
        var secondLastIndex = currentURL.lastIndexOf("/", lastIndex - 1);
        var thirdLastIndex = currentURL.lastIndexOf("/", secondLastIndex - 1);
        var baseURL = currentURL.substring(0, thirdLastIndex + 1);

        console.log("Base URL: " + baseURL);
    </script>
  
  </head>
<body>
<div class="container">
	 
    <h1 class="text-center my-4">View Tickets</h1>
    <%@ include file="../nav/nav.jsp" %> 
    <% for (BusTicketBooking ticket : tickets) { %>
    <div class="row">
        <div class="col-lg-12">
            <div class="ticket-card">
                <div class="ticket-header">
                    <h4 class="ticket-title">Ticket #<%= ticket.getBookingId() %></h4>
                </div>
                <div class="ticket-body">
                    <div class="ticket-details">
                        <div class="row">
                            <div class="col-md-6">
                                <p><strong>Passenger Name:</strong><%= ticket.getFirstName() %></p>
                                <p><strong>From:</strong><%= ticket.getFromLocation() %></p>
                                <p><strong>To:</strong><%= ticket.getToLocation() %></p>
                                <p><strong>Date of Journey:</strong><%= ticket.getJourneyDate() %></p>
                                <p><strong>Time of Journey:</strong><%= ticket.getBoardingTime() %></p>
                            </div>
                            <div class="col-md-6">
                                <p><strong>Transport mode:</strong><%= ticket.getBusType() %></p>
                                <p><strong>Boarding Point:</strong><%= ticket.getBoardingPoint() %></p>
                                <p><strong>Drop-off Point:</strong><%= ticket.getDropOffPoint() %></p>
                                <p><strong>Contact Number:</strong><%= ticket.getContactNumber() %></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <p><strong>Email:</strong><%= ticket.getEmail() %></p>
                                <p><strong>Booking Date:</strong><%= ticket.getBookingDate() %></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ticket-actions">
                    <input type="hidden" value="<%= ticket.getBookingId() %>" class="ticketId">
                    <button class="btn btn-primary btn-sm edit">Edit</button>
                    <button class="btn btn-danger btn-sm cancel" data-ticket-id="<%= ticket.getBookingId() %>">Cancel</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Edit Ticket Modal -->
    <div class="modal fade" id="editModal_<%= ticket.getBookingId() %>" tabindex="-1" role="dialog" aria-labelledby="editModalLabel_<%= ticket.getBookingId() %>" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalLabel_<%= ticket.getBookingId() %>">Edit Ticket #<%= ticket.getBookingId() %></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="editTicketForm_<%= ticket.getBookingId() %>">
                        <input type="hidden" id="editTicketId_<%= ticket.getBookingId() %>" value="<%= ticket.getBookingId() %>">
                        <div class="form-group">
                            <label for="editJourneyDate_<%= ticket.getBookingId() %>">New Date of Journey:</label>
                            <input type="date" class="form-control" id="editJourneyDate_<%= ticket.getBookingId() %>" required>
                        </div>
                        <div class="form-group">
                            <label for="editBoardingTime_<%= ticket.getBookingId() %>">New Time of Journey:</label>
                            <input type="time" class="form-control" id="editBoardingTime_<%= ticket.getBookingId() %>" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary saveChangesModal" data-ticket-id="<%= ticket.getBookingId() %>">Save changes</button>
                </div>
            </div>
        </div>
    </div>
    <% } %>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>

$(document).ready(function() {
    $(document).on('click', '.edit', function() {
        var ticketId = $(this).closest('.ticket-card').find('.ticketId').val();
        var journeyDate = $(this).closest('.ticket-card').find('p strong:contains("Date of Journey:")').next().text().trim();
        var boardingTime = $(this).closest('.ticket-card').find('p strong:contains("Time of Journey:")').next().text().trim();

        $('#editJourneyDate_' + ticketId).val(journeyDate);
        $('#editBoardingTime_' + ticketId).val(boardingTime);

        $('#editModal_' + ticketId).modal('show');
    });

    // Event handler for save changes in modal
    $(document).on('click', '.saveChangesModal', function() {
        var ticketId = $(this).data('ticket-id');
        var newJourneyDate = $('#editJourneyDate_' + ticketId).val();
        var newBoardingTime = $('#editBoardingTime_' + ticketId).val();

        var formData = new FormData();
        formData.append('ticketID', ticketId);
        formData.append('newJourneyDate', newJourneyDate);
        formData.append('newBoardingTime', newBoardingTime);

        let url = baseURL + 'updateTicket';

        $.ajax({
            type: 'POST',
            url: url,
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                let res = JSON.parse(response);
                if (res.status === 'success') {
                    $('#editModal_' + ticketId).modal('hide'); // Hide modal after saving
                    alert('Ticket updated successfully!');
                    
                    window.location.href =  baseURL;
                } else {
                    alert('Update failed!');
                }
            },
            error: function(error) {
                alert('Error updating ticket: ' + error);
            }
        });
    });
	$(".cancel").click(function(){
		let ticketId = $(this).data('ticket-id');
		alert(ticketId)
		 var formData = new FormData();
	     formData.append('ticketID', ticketId);
	     
	        let url = baseURL + 'deleteTicket';

	        $.ajax({
	            type: 'POST',
	            url: url,
	            data: formData,
	            processData: false,
	            contentType: false,
	            success: function(response) {
	                let res = JSON.parse(response);
	                if (res.status === 'success') {
	                    alert('Ticket canceled successfully!');
	                    window.location.href =  baseURL ;
	                } else {
	                    alert('cancel failed!');
	                }
	            },
	            error: function(error) {
	                alert('Error canceling ticket: ' + error);
	            }
	        });
	     
	})
  
});

</script>
</body>
</html>
