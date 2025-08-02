<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register Farmer</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #e8f5e9; /* light green */
            font-family: 'Segoe UI', sans-serif;
            height: 100vh;
        }

        .back-btn {
            position: absolute;
            top: 20px;
            left: 20px;
        }

        .back-btn a {
            text-decoration: none;
            color: white;
            background-color: #66bb6a;
            padding: 8px 12px;
            border-radius: 6px;
            font-weight: bold;
        }

        .back-btn a:hover {
            background-color: #388e3c;
        }

        .form-box {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            width: 350px;
            margin: auto;
            margin-top: 100px;
        }

        h2 {
            text-align: center;
            color: #2e7d32;
            margin-bottom: 20px;
        }

        label {
            color: #1b5e20;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            margin: 6px 0 16px;
            border: 1px solid #a5d6a7;
            border-radius: 6px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #66bb6a;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #388e3c;
        }
    </style>
</head>
<body>

<div class="back-btn">
    <a href="Farmer_Dashboard.jsp">Back</a>
</div>

<div class="form-box">
    <h2>Farmer Registration</h2>
    <form action="Register_Farmer_1" method="post">
        <label>Name:</label><br>
        <input type="text" name="name" required><br>

        <label>Contact:</label><br>
        <input type="text" name="contact" required><br>

        <label>Address:</label><br>
        <input type="text" name="address" required><br>

        <label>Email:</label><br>
        <input type="email" name="email" required><br>

        <label>Password:</label><br>
        <input type="password" name="password" required><br>

        <input type="submit" value="Register">
    </form>
</div>

</body>
</html>
