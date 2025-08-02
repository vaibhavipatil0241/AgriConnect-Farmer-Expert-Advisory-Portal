<%@ page import="java.sql.*" %>
<%@ page import="r3sys.com.DbConnection" %>

<!DOCTYPE html>
<html>
<head>
    <title>Delete Expert</title>
    <style>
        body {
            background-color: #e8f5e9; /* light green */
            font-family: 'Segoe UI', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .message-box {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
            text-align: center;
        }

        .message-box h2 {
            color: #2e7d32; /* dark green */
        }

        .message-box p {
            color: #555;
        }

        a {
            display: inline-block;
            margin-top: 15px;
            padding: 8px 16px;
            background-color: #66bb6a;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }

        a:hover {
            background-color: #388e3c;
        }
    </style>
</head>
<body>

<div class="message-box">
<%
String id = request.getParameter("e_id");

if (id != null) {
    Connection con = null;
    PreparedStatement pstmt = null;

    try {
        con = DbConnection.connect();
        pstmt = con.prepareStatement("DELETE FROM expert WHERE e_id = ?");
        pstmt.setInt(1, Integer.parseInt(id));

        int rows = pstmt.executeUpdate();

        if (rows > 0) {
            response.sendRedirect("ViewExpert_Admin_3.jsp");
        } else {
%>
    <h2>Delete Failed</h2>
    <p>No expert found with ID: <%= id %></p>
    <a href="ViewExpert_Admin_3.jsp">Back</a>
<%
        }

    } catch (Exception e) {
%>
    <h2>Error</h2>
    <p><%= e.getMessage() %></p>
    <a href="ViewExpert_Admin_3.jsp">Back</a>
<%
        e.printStackTrace();
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
        if (con != null) try { con.close(); } catch (Exception e) {}
    }
} else {
%>
    <h2>Invalid Request</h2>
    <p>Expert ID is missing or invalid.</p>
    <a href="ViewExpert_Admin_3.jsp">Back</a>
<%
}
%>
</div>

</body>
</html>
