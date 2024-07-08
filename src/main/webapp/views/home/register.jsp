<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>

    <!-- CSS -->
    <link href="<c:url value='/resources/css/register.css' />" rel="stylesheet">

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
    <form id="registerForm">
        <h1 class="text-center my-4">Registration Form</h1>

        <div class="row">
            <div class="col-md-6">
                <fieldset>
                    <legend>Personal Information</legend>
                    <div class="form-group">
                        <label for="firstName">First Name:</label>
                        <input type="text" class="form-control" id="firstName" name="firstName" required>
                    </div>
                    <div class="form-group">
                        <label for="lastName">Last Name:</label>
                        <input type="text" class="form-control" id="lastName" name="lastName" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <input type="hidden" id="roleid" name="roleid" value="3">
                </fieldset>
            </div>

            <div class="col-md-6">
                <fieldset>
                    <legend>Account Details</legend>
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
                        <label for="password">Password:</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password:</label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                    </div>
                </fieldset>
            </div>
        </div>

        <button type="submit" class="btn btn-primary btn-block mt-4">Register</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="<c:url value='/resources/js/main.js' />"></script>
<script src="<c:url value='/resources/js/script.js' />"></script>
</body>
</html>
