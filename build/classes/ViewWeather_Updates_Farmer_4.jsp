<%@ page import="java.sql.*" %>
<%@ page import="r3sys.com.DbConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Weather Updates</title>
    <style>
        body {
            font-family: Arial;
            background-color: #e8f5e9;
            padding: 40px;
        }
        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            background-color: white;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #43a047;
            color: white;
        }
        h1 {
            text-align: center;
            color: #2e7d32;
        }
    </style>
</head>
<body>
    <h1>Weather Updates</h1>
    <%
        Connection con = DbConnection.connect();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM weather ORDER BY date DESC");
        ResultSet rs = ps.executeQuery();
    %>
    <table>
        <tr>
            <th>w_id</th>
            <th>Title</th>
            <th>Description</th>
            <th>Date</th>
        </tr>
        <%
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("w_id") %></td>
            <td><%= rs.getString("postTitle") %></td>
            <td><%= rs.getString("postDesc") %></td>
            <td><%= rs.getDate("date") %></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
