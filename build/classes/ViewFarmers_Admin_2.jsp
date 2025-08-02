<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="r3sys.com.DbConnection" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>View Farmers</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #e8f5e9; /* light green background */
            font-family: 'Segoe UI', sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h2 {
            color: #2e7d32;
            margin-top: 30px;
        }

        form {
            margin: 20px;
        }

        input[type="text"] {
            padding: 8px;
            border: 1px solid #a5d6a7;
            border-radius: 6px;
            width: 200px;
        }

        input[type="submit"] {
            padding: 8px 16px;
            background-color: #66bb6a;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            margin-left: 10px;
        }

        input[type="submit"]:hover {
            background-color: #388e3c;
        }

        table {
            border-collapse: collapse;
            background-color: white;
            margin-bottom: 40px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        th, td {
            border: 1px solid #c8e6c9;
            padding: 10px 15px;
            text-align: center;
        }

        th {
            background-color: #a5d6a7;
            color: #1b5e20;
        }

        td {
            color: #2e7d32;
        }
    </style>
</head>
<body>

<h2>Search Farmer</h2>
<form method="get" action="">
    <input type="text" name="search" placeholder="Search by name">
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
            pstmt = con.prepareStatement("SELECT * FROM farmer WHERE name LIKE ?");
            pstmt.setString(1, "%" + searchValue + "%");
        } else {
            pstmt = con.prepareStatement("SELECT * FROM farmer");
        }

        rs = pstmt.executeQuery();
%>

<h2>Farmer List</h2>
<table>
    <tr>
        <th>Farmer ID</th>
        <th>Name</th>
        <th>Contact</th>
        <th>Address</th>
        <th>Email</th>
        <th>Password</th>
    </tr>

<%
    while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("f_id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("contact") %></td>
        <td><%= rs.getString("address") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("password") %></td>
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
