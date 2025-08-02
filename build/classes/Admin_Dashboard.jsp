<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Dashboard</title>
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Segoe UI', sans-serif;
        background-color: #e8f5e9; /* light green */
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        position: relative;
    }

    .dashboard-box {
        background: white;
        padding: 40px;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        text-align: center;
        width: 300px;
    }

    h2 {
        color: #2e7d32;
        margin-bottom: 30px;
    }

    a {
        display: block;
        background-color: #66bb6a;
        color: white;
        padding: 10px;
        margin: 10px 0;
        border-radius: 8px;
        text-decoration: none;
        font-weight: bold;
        transition: background-color 0.3s;
    }

    a:hover {
        background-color: #388e3c;
    }

    .logout-btn {
        position: absolute;
        top: 20px;
        right: 20px;
        background-color: #81c784;
        padding: 8px 14px;
        border-radius: 6px;
        text-decoration: none;
        color: white;
        font-weight: bold;
    }

    .logout-btn:hover {
        background-color: #558b2f;
    }

    .back-button {
        position: absolute;
        top: 20px;
        left: 20px;
        background-color: #66bb6a;
        padding: 8px 14px;
        border-radius: 6px;
        text-decoration: none;
        color: white;
        font-weight: bold;
    }

    .back-button:hover {
        background-color: #4ca14a;
    }
</style>
</head>
<body>

<a href="login_admin.html" class="back-button">Back</a>
<a href="logout_admin.jsp" class="logout-btn">Logout</a>

<div class="dashboard-box">
    <h2>Welcome to Admin Dashboard</h2>
    <form>
        <a href="AddExpert_Admin_1.jsp">Add Expert</a>
        <a href="ViewFarmers_Admin_2.jsp">View Farmer</a>
        <a href="ViewExpert_Admin_3.jsp">View Expert</a>
        <a href="DeleteExpert_Admin_4.jsp">Delete Expert</a>
    </form>
</div>

</body>
</html>
