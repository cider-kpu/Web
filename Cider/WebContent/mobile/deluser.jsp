 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="org.json.simple.*"
    import="java.sql.*"%>

<%
  	// 데이터를 안드로이드에서 받음
	String id = request.getParameter("id");
  
	// DB 연결
	Connection conn=null;
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cider", "root","1234");
	
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery("Select count(*) from user where email='"+id+"'");
	rs.next();
	
	
	
	// JSON 부분 (미사용)
	
	//JSONObject jsonMain = new JSONObject();
	//JSONArray jArray = new JSONArray();
	
	//JSONObject jObject1 = new JSONObject();
	//JSONObject jObject2 = new JSONObject();
	//JSONObject jObject3 = new JSONObject();
	//
	
	
	// ID 확인
	if(rs.getInt("count(*)") == 0){
		out.print("None");
	}else{
		Statement stmt2 = conn.createStatement();
		stmt2.executeUpdate("delete from user where email='"+id+"'");
		out.print("True");
	}
	
	rs.close();
	conn.close();
	stmt.close();
%>