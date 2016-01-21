<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
    %>
    
<%
	Connection conn;	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cider", "root","1234");

	Statement stmt = conn.createStatement();
	
	String email = (String)session.getAttribute("ID");
	
	String pw = request.getParameter("pw");
	String pn = request.getParameter("pn");
	pn = new String(pn.getBytes("8859_1"), "euc-kr");
	String name = request.getParameter("name");
	name = new String(name.getBytes("8859_1"), "euc-kr");

	stmt.executeUpdate("update user set pn='"+pn+"', name='"+name+"'"+", pw='"+pw+"' where email='"+email+"'");
	pageContext.forward("../pages/profile.jsp");
	
	stmt.close();
	conn.close();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

</html>