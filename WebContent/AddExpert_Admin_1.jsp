<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Expert</title>
    <style>
        body {
            background-color: #e8f5e9; /* light green */
            font-family: 'Segoe UI', sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        h2 {
            color: #2e7d32;
        }

        form {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            width: 300px;
        }

        label {
            font-weight: bold;
            color: #388e3c;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            margin: 6px 0 15px;
            border: 1px solid #a5d6a7;
            border-radius: 6px;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #66bb6a;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #388e3c;
        }
    </style>
</head>
<body>
    <h2>Add Expert</h2>
    <form action="AddExpert_Admin_1" method="post">
        <label>Name:</label><br>
        <input type="text" name="name" required><br><br>

        <label>Specialization:</label><br>
        <input type="text" name="specialization" required><br><br>

        <label>Contact:</label><br>
        <input type="text" name="contact" required><br><br>

        <label>Email:</label><br>
        <input type="email" name="email" required><br><br>

        <label>Password:</label><br>
        <input type="password" name="password" required><br><br>

        <input type="submit" value="Add Expert">
    </form>
</body>
</html>
