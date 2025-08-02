<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="r3sys.com.DbConnection" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>View Farmers' Queries</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #e8f5e9;
            font-family: 'Segoe UI', sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h2 {
            margin-top: 30px;
            color: #2e7d32;
        }

        table {
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 1100px;
        }

        th, td {
            border: 1px solid #c8e6c9;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #a5d6a7;
            color: #1b5e20;
        }

        td {
            color: #2e7d32;
        }

        img {
            border-radius: 6px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

<h2>Farmers' Crop Issue Queries</h2>

<%
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    con = DbConnection.connect();

    if (con == null) {
        out.println("Database connection failed.");
    } else {
        pstmt = con.prepareStatement("SELECT * FROM queries ORDER BY date DESC");
        rs = pstmt.executeQuery();
%>

<table>
    <tr>
        <th>Query ID</th>
        <th>Farmer ID</th>
        <th>Crop Type</th>
        <th>Issue Description</th>
        <th>Image</th>
        <th>Date</th>
        <th>Status</th>
    </tr>

    <%
        while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("q_id") %></td>
        <td><%= rs.getInt("f_id") %></td>
        <td><%= rs.getString("cropType") %></td>
        <td><%= rs.getString("issueDescription") %></td>
        <td>
            <%
                String imagePath = rs.getString("imagePath");
                if (imagePath != null && !imagePath.isEmpty()) {
            %>
                <img src="<%= imagePath %>" width="100" height="100" />
            <% } else { %>
                No Image
            <% } %>
        </td>
        <td><%= rs.getString("date") %></td>
        <td><%= rs.getString("status") %></td>
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
