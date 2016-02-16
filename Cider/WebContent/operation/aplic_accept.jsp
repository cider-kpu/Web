<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
    %>
    
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int gcode = Integer.parseInt(request.getParameter("gcode"));
	
	Connection conn;	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cider", "root","1234");

	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("Select * from application where idx="+idx+" and gidx="+gcode);
	
	rs.next();
	String email = rs.getString("writer");
	
	Statement stmt2 = conn.createStatement();
	stmt2.executeUpdate("update user set gcode="+gcode+", gpwr=0 where email='"+email+"'");
	
	pageContext.forward("../operation/reject.jsp?idx="+idx+"&gcode="+gcode);
	
	stmt.close();
	stmt2.close();
	rs.close();
	conn.close();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

</html>