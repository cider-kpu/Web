<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
    %>
    
<%
	String id = (String)request.getParameter("id");
	
	Connection conn;	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cider", "root","1234");

	Statement stmt = conn.createStatement();
	stmt.executeUpdate("update user set gcode=0, gpwr=0 where email='"+id+"'");
	
	pageContext.forward("/Cider/pages/team/memberlist.jsp");
	
	stmt.close();
	conn.close();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

</html>