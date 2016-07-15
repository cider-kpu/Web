 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="org.json.simple.*"
    import="java.sql.*"%>

<%
  	// 데이터를 안드로이드에서 받음
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	name = java.net.URLDecoder.decode(name,"UTF-8");
	String pn = request.getParameter("pn");
	
	// DB 연결
	Connection conn=null;
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cider", "root","1234");
	
	Statement stmt = conn.createStatement();
	Statement stmt2 = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery("Select count(*) from user where email='"+id+"'");
	rs.next();
	
	
	// E-mail(ID) 가 이미 존재하는지 확인
	if(rs.getInt("count(*)") != 0)
		out.print("이미 존재하는 E-mail 입니다");
	else{
		stmt2.executeUpdate("insert into user(email, pw, name, pn) values('"+id+"', '"+pw+"', '"+name+"', '"+pn+"')");
		out.print("가입이 완료되었습니다.");
	}
	
	conn.close();
	stmt.close();
	stmt2.close();
	rs.close();
%>