

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
    session.invalidate();  // 🔴 Destroy the current session
    response.sendRedirect("login_expert.html");  // 🔁 Redirect to login page
%>

