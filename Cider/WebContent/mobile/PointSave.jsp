 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="org.json.simple.*"
    import="java.sql.*"%>

<%
  	// 데이터를 안드로이드에서 받음
	int id = Integer.parseInt(request.getParameter("id"));
	double x = Double.parseDouble(request.getParameter("x"));
	double y = Double.parseDouble(request.getParameter("x"));
	
	// DB 연결
	Connection conn=null;
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cider", "root","1234");
	
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery("Select count(*) from point where idx='"+id+"'");
	rs.next();

	if(rs.getInt("count(*)") == 0){
		Statement stmt2 = conn.createStatement();
		stmt2.executeUpdate("insert into point(idx, x, y) values('"+id+"', '"+x+"', '"+y+"')");
		stmt2.close();
	}else{
		Statement stmt2 = conn.createStatement();
		stmt2.executeUpdate("update point set x='"+x+"', y='"+y+"' where idx="+id);
	}
	
	out.print("완료되었습니다.");
	
	rs.close();
	conn.close();
	stmt.close();
%>