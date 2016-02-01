<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%
	// 로그인 Page 데이터 받기
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// DB 연결
	Statement stmt;
	
	Connection conn=null;
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cider", "root","1234");
	
	stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery("Select count(*) from user where email='"+id+"'and pw='"+pw+"'");
	
	rs.next();
	
	
	if(rs.getInt("count(*)") != 0){
		session.setAttribute("ID", id);
		
		Statement stmt2;
		stmt2 = conn.createStatement();
		ResultSet rs2 = stmt2.executeQuery("Select * from user where email='"+id+"'");
		rs2.next();
		
		int gcode = rs2.getInt("gcode");
		session.setAttribute("GCODE", gcode);
		if(gcode != 0){
			Statement stmt3 = conn.createStatement();
			ResultSet rs3 = stmt3.executeQuery("select * from team where idx="+gcode);
			rs3.next();
			
			session.setAttribute("GNAME", rs3.getString("name"));
			session.setAttribute("GPWR", rs2.getInt("gpwr"));
			
		}
		
		response.sendRedirect("/Cider/pages/index.jsp");
		
		stmt2.close();
		rs2.close();
	}
	%>
	<script>
		alert('잘못된 Email 또는 Password 입니다.');
		location.href="\\Cider\\pages\\login.html";
	</script>
	<%	
	stmt.close();
	conn.close();
	rs.close();
%>
</html>