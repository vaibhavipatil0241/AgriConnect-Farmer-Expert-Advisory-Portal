<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Post Crop Issue</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #e8f5e9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: white;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            width: 400px;
            text-align: center;
        }

        h2 {
            color: #2e7d32;
            margin-bottom: 20px;
        }

        input, textarea, button {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        textarea {
            resize: none;
            height: 80px;
        }

        input[type="file"] {
            border: none;
            padding: 3px;
        }

        button {
            background-color: #4caf50;
            color: white;
            border: none;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #388e3c;
        }

        .back-btn {
            position: absolute;
            top: 20px;
            left: 20px;
            background-color: #4caf50;
            color: white;
            padding: 8px 14px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
            font-size: 14px;
        }

        .back-btn:hover {
            background-color: #388e3c;
        }
    </style>
</head>
<body>

<a href="Farmer_Dashboard.jsp" class="back-btn">Back</a>

<div class="form-container">
    <h2>Post Crop Issue</h2>
    <form action="PostCropIssues_Farmer_3" method="post" enctype="multipart/form-data">
        <input type="text" name="cropType" placeholder="Enter Crop Type" required>
        <textarea name="issueDescription" placeholder="Describe the issue..." required></textarea>
        <input type="date" name="date" required>
        <input type="file" name="cropImage" accept="image/*" required>
        <button type="submit">Submit Issue</button>
    </form>
</div>

</body>
</html>
