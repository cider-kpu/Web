<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.sql.*"
	import="java.util.*"
	import="java.text.*"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%    
    //제대로 utf-8환경이 아니라 한글 깨짐 그래서 임의로 추가                                                   
    request.setCharacterEncoding("UTF-8");
    
    String title = request.getParameter("test");
    
    	Connection conn=null;
	
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cider", "root","1234");
	
		Statement stmt = conn.createStatement();
		Statement stmt2 = conn.createStatement();
		Statement stmt3 = conn.createStatement();
	
		stmt.executeUpdate("insert into article(idx, subject, writer, contents, date, board) values("+100+", '"+title+"', '"+"asdf@asdf"+"', '"+"한글"+"', '"+"2016-03-17"+"', "+"1"+" )");

		conn.close();
		stmt.close();
		stmt2.close();
		stmt3.close();

	%>
		<script>
			alert('입력되지 않은 데이터가 있습니다.');
			location.href="/Cider/pages/board/vboard?bcode="+bcode;
		</script>
		<%	
%>
