<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	// 회원가입 Page 데이터 받기
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String pn = request.getParameter("pn");
	
	// DB 연결
	Statement stmt;
	Connection conn=null;
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cider", "root","1234");
	
	stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("Select count(*) from user where email='"+id+"'");
	rs.next();
	
	// ID(Email) 체크
	if(rs.getInt("count(*)") == 0){
		
		Statement stmt2 = conn.createStatement();
		stmt2.executeLargeUpdate("insert into user(email, pw, name, pn) values('"+id+"', '"+pw+"', '"+name+"', '"+pn+"')");
		
		stmt2.close();
		conn.close();
		rs.close();
		response.sendRedirect("/Cider/pages/login.html");
		
	}
	%>
	<script>
		alert('이미 존재하는 Email 입니다.');
		location.href="/Cider/pages/signin.jsp";
	</script>
	<%	
	stmt.close();
	conn.close();
	rs.close();
%>
<html>
</html>