<!DOCTYPE html> 
<html>
<head>
  <title>Expert Dashboard</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #eaf6ec;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .dashboard-container {
      background-color: white;
      padding: 40px 30px;
      border-radius: 12px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      text-align: center;
      width: 300px;
      position: relative;
    }

    h2 {
      color: #2f8f46;
      font-size: 24px;
      margin-bottom: 30px;
    }

    .button {
      background-color: #57b956;
      color: white;
      border: none;
      border-radius: 8px;
      padding: 12px;
      margin: 10px 0;
      width: 100%;
      font-size: 16px;
      font-weight: bold;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .button:hover {
      background-color: #4ca14a;
    }

    .back-button {
      position: absolute;
      top: 10px;
      left: 10px;
      background-color: #57b956;
      color: white;
      padding: 6px 14px;
      border-radius: 6px;
      text-decoration: none;
      font-size: 14px;
      font-weight: bold;
      transition: background-color 0.3s ease;
    }

    .back-button:hover {
      background-color: #4ca14a;
    }
  </style>
</head>
<body>
  <a href="login_expert.html" class="back-button">Back</a>

  <div class="dashboard-container">
    <h2>Welcome to<br>Expert Dashboard</h2>

    <form action="ViewFarmers_Queries_Expert_2.jsp">
      <button class="button">View Farmer Queries</button>
    </form>

    <form action="Response_to_Queries_Expert_3.jsp">
      <button class="button">Response to Queries</button>
    </form>

    <form action="delete_expert.jsp">
      <button class="button">Delete Expert</button>
    </form>
  </div>
</body>
</html>
