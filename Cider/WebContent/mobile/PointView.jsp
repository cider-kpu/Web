 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="org.json.simple.*"
    import="java.sql.*"%>

<%
  	// 데이터를 안드로이드에서 받음
	int id = Integer.parseInt(request.getParameter("id"));
  	
	

	// DB 연결
	Connection conn=null;
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cider", "root","1234");
	
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery("Select * from point where idx='"+id+"'");
	rs.next();

	out.print(rs.getInt("idx")+" "+rs.getDouble("x")+" "+rs.getDouble("y"));
	
	rs.close();
	conn.close();
	stmt.close();
%>