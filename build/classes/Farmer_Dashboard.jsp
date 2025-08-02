<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Farmer Dashboard</title>
<style>
    body {
        background-color: #e8f5e9; /* light green */
        font-family: Arial, sans-serif;
    }

    h2 {
        color: #2e7d32;
        text-align: center;
    }

    .container {
        text-align: center;
    }

    .btn {
        display: inline-block;
        padding: 10px 20px;
        margin: 10px;
        background-color: #a5d6a7;
        color: #1b5e20;
        text-decoration: none;
        border-radius: 6px;
        font-weight: bold;
    }

    .btn:hover {
        background-color: #81c784;
    }

    .back-btn {
        text-align: left;
        margin: 20px;
    }

</style>
</head>
<body>

<div class="back-btn">
    <a href="login_farmer.html" class="btn">Back</a>
</div>

<h2>Welcome to Farmer Dashboard</h2>

<div class="container">
    <a href="PostCropIssues_Farmer_3.jsp" class="btn">Post Crop Issues</a><br><br>
    <a href="ViewExpert_Responses_Farmer_3.jsp" class="btn">View Expert Responses</a><br><br>
    <a href="ViewWeather_Updates_Farmer_4.jsp" class="btn">View Weather Updates</a><br><br>
    <a href="ChangePassword_Farmer_5.jsp" class="btn">Change Password</a><br><br>
    <a href="logout_farmer.jsp" class="btn">Logout Farmer</a>
</div>

</body>
</html>
