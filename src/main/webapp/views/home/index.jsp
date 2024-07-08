<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bus ticket booking</title>

    <!-- CSS -->
    <link href="<c:url value='/resources/css/styles.css' />" rel="stylesheet">

    <!-- BOOTSTRAP -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

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
    <form id="bookTicket">
        <h1 class="text-center my-4">Bus Ticket Booking Form</h1>
<%@ include file="../nav/nav.jsp" %> 
        <div class="row">
            <div class="col-md-6">
                <fieldset>
                    <legend>Passenger Information</legend>
                    <div class="form-group">
                        <label for="firstName">First Name:</label>
                        <input type="text" class="form-control" id="firstName" name="firstName" required>
                    </div>
                    <div class="form-group">
                        <label for="lastName">Last Name:</label>
                        <input type="text" class="form-control" id="lastName" name="lastName" required>
                    </div>
                    <div class="form-group">
                        <label for="age">Age:</label>
                        <input type="number" class="form-control" id="age" name="age" required>
                    </div>
                    <div class="form-group">
                        <label for="gender">Gender:</label>
                        <select class="form-control" id="gender" name="gender" required>
                            <option value="" disabled selected>Select your gender</option>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                            <option value="other">Other</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="contactNumber">Contact Number:</label>
                        <input type="tel" class="form-control" id="contactNumber" name="contactNumber" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email Address:</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                </fieldset>
            </div>

            <div class="col-md-6">
                <fieldset>
                    <legend>Booking Details</legend>
                    <div class="form-group">
                        <label for="fromLocation">From:</label>
                        <input type="text" class="form-control" id="fromLocation" name="fromLocation" required>
                    </div>
                    <div class="form-group">
                        <label for="toLocation">To:</label>
                        <input type="text" class="form-control" id="toLocation" name="toLocation" required>
                    </div>
                    <div class="form-group">
                        <label for="journeyDate">Date of Journey:</label>
                        <input type="date" class="form-control" id="journeyDate" name="journeyDate" required>
                    </div>
                    <div class="form-group">
                        <label for="boardingTime">Boarding Time:</label>
                        <input type="time" class="form-control" id="boardingTime" name="boardingTime" required>
                    </div>
                    <div class="form-group">
                        <label for="busType">Transport Mode:</label>
                        <select class="form-control" id="busType" name="busType" required>
                            <option value="" disabled selected>Select travel mode</option>
                            <option value="Bus">Bus</option>
                            <option value="Train">Train</option>
                            <option value="Flight">Flight</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="boardingPoint">Preferred Boarding Point:</label>
                        <input type="text" class="form-control" id="boardingPoint" name="boardingPoint" required>
                    </div>
                    <div class="form-group">
                        <label for="dropOffPoint">Preferred Drop-off Point:</label>
                        <input type="text" class="form-control" id="dropOffPoint" name="dropOffPoint" required>
                    </div>
                </fieldset>
            </div>
        </div>

        <fieldset>
            <legend>Terms and Conditions</legend>
            <div class="form-check">
                <input type="checkbox" class="form-check-input" id="agreeTerms" name="agreeTerms" required>
                <label class="form-check-label" for="agreeTerms">
                    I agree to the <a href="/terms">terms and conditions</a>.
                </label>
            </div>
            <div class="form-check">
                <input type="checkbox" class="form-check-input" id="agreeCancellation" name="agreeCancellation" required>
                <label class="form-check-label" for="agreeCancellation">
                    I agree to the <a href="/cancellation-policy">cancellation policy</a>.
                </label>
            </div>
        </fieldset>

        <button type="submit" class="btn btn-primary btn-block mt-4">Book Now</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="<c:url value='/resources/js/main.js' />"></script>
<script src="<c:url value='/resources/js/script.js' />"></script>
</body>
</html>
