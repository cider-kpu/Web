 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="org.json.simple.*"
    import="java.sql.*"%>

<%
  	// 데이터를 안드로이드에서 받음
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
  
	// DB 연결
	Connection conn=null;
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cider", "root","1234");
	
	Statement stmt = conn.createStatement();
	Statement stmt2 = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery("Select count(*) from user where email='"+id+"'and pw='"+pw+"'");
	
	
	rs.next();
	
	// 초기 선언
	JSONObject jsonMain = new JSONObject();
	JSONArray jArray = new JSONArray();
	
	JSONObject jObject1 = new JSONObject();
	JSONObject jObject2 = new JSONObject();
	JSONObject jObject3 = new JSONObject();

	// 로그인 확인
	if(rs.getInt("count(*)") == 0){
		out.print("False");
	}else{
		out.print("True");
	}
%>