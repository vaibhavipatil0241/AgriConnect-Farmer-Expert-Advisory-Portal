<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="r3sys.com.DbConnection" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.DriverManager" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>View Expert Responses</title>
    <style>
        body {
            background-color: #e8f5e9; /* light green */
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 20px;
        }

        h2 {
            color: #2e7d32; /* dark green */
            margin-bottom: 20px;
        }

        form {
            margin-bottom: 30px;
        }

        input[type="text"] {
            padding: 8px;
            width: 250px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            padding: 8px 16px;
            background-color: #a5d6a7;
            border: none;
            color: black;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #81c784;
        }

        table {
            margin: 0 auto;
            border-collapse: collapse;
            width: 90%;
            background-color: #ffffff;
            box-shadow: 0px 0px 10px #c8e6c9;
        }

        th, td {
            padding: 10px;
            border: 1px solid #4caf50;
        }

        th {
            background-color: #c8e6c9;
            color: #1b5e20;
        }

        td {
            background-color: #f1f8e9;
        }
    </style>
</head>
<body>

<form method="get" action="">
    <input type="text" name="search" placeholder="Search by Crop Type">
    <input type="submit" value="Search">
</form>

<%
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    con = DbConnection.connect();

    if (con == null) {
        out.println("Database connection failed.");
    } else {
        String searchValue = request.getParameter("search");

        if (searchValue != null && !searchValue.trim().isEmpty()) {
            pstmt = con.prepareStatement("SELECT r.r_id, q.cropType, q.issueDescription, r.responseText, r.date " +
                "FROM responses r JOIN queries q ON r.queryId = q.q_id " +
                "WHERE q.cropType LIKE ?");
            pstmt.setString(1, "%" + searchValue + "%");
        } else {
            pstmt = con.prepareStatement("SELECT r.r_id, q.cropType, q.issueDescription, r.responseText, r.date " +
                "FROM responses r JOIN queries q ON r.queryId = q.q_id");
        }

        rs = pstmt.executeQuery();
%>

<h2>Expert Responses to Crop Issues</h2>

<table>
    <tr>
        <th>Response ID</th>
        <th>Crop Type</th>
        <th>Issue Description</th>
        <th>Expert Response</th>
        <th>Date</th>
    </tr>

<%
    while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("r_id") %></td>
        <td><%= rs.getString("cropType") %></td>
        <td><%= rs.getString("issueDescription") %></td>
        <td><%= rs.getString("responseText") %></td>
        <td><%= rs.getDate("date") %></td>
    </tr>
<%
    }
%>
</table>

<%
    }
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
    e.printStackTrace();
} finally {
    if (rs != null) try { rs.close(); } catch (Exception e) {}
    if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
    if (con != null) try { con.close(); } catch (Exception e) {}
}
%>

</body>
</html>
