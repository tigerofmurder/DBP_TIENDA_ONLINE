<%@page session="true" import="java.sql.*" pageEncoding="UTF-8"%>
<%
	session.invalidate();
	response.sendRedirect("home.html");
%>