<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Change Password - Expert</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #e8f5e9; /* light green */
            font-family: 'Segoe UI', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            width: 350px;
        }

        h2 {
            text-align: center;
            color: #2e7d32; /* dark green */
        }

        label {
            font-weight: bold;
            color: #388e3c;
        }

        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0 20px;
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
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #388e3c;
        }
    </style>
</head>
<body>

<form action="ChangePassword_Expert_4" method="post">
    <h2>Change Password</h2>

    <label>Current Password:</label><br>
    <input type="password" name="currentPassword" required><br>

    <label>New Password:</label><br>
    <input type="password" name="newPassword" required><br>

    <label>Confirm New Password:</label><br>
    <input type="password" name="confirmPassword" required><br>

    <input type="submit" value="Change Password">
</form>

</body>
</html>
