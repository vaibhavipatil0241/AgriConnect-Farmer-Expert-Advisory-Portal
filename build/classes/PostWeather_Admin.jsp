<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Post Weather Update</title>
    <style>
        body {
            background-color: #e3f2fd;
            font-family: Arial;
            padding: 40px;
        }
        form {
            background-color: white;
            padding: 20px;
            width: 400px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }
        input, textarea {
            width: 100%;
            margin: 10px 0;
            padding: 10px;
        }
        button {
            background-color: #2196F3;
            color: white;
            border: none;
            padding: 10px 20px;
        }
    </style>
</head>
<body>
    <form action="PostWeather_Admin" method="post">
        <h2>Post Weather Info</h2>

        <label>ID (w_id):</label>
        <input type="number" name="w_id" required>

        <label>Title:</label>
        <input type="text" name="postTitle" required>

        <label>Description:</label>
        <textarea name="postDesc" rows="4" required></textarea>

        <label>Date (yyyy-mm-dd):</label>
        <input type="date" name="date" required>

        <button type="submit">Submit</button>
    </form>
</body>
</html>
