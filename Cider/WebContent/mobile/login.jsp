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
		jObject1.put("check", "false");
		
		// 위에서 만든 각각의 객체를 하나의 배열 형태로 만듬
		jArray.add(0, jObject1);

		// 최종적으로 배열을 하나로 묶음
		jsonMain.put("Login", jArray);
		
		// 안드로이드에 보낼 데이터를 출력
		out.println(jsonMain.toJSONString());
	}else if(rs.getInt("count(*)") == 1){
		
		ResultSet rs2 = stmt2.executeQuery("Select * from user where email='"+id+"'and pw='"+pw+"'");
		rs2.next();
		
		// 안드로이드로 보낼 메시지를 만듬
		jObject1.put("check", "true");
		    
		// 위에서 만든 각각의 객체를 하나의 배열 형태로 만듬
		jArray.add(0, jObject1);

		// 최종적으로 배열을 하나로 묶음
		jsonMain.put("Login", jArray);
		
		// 안드로이드에 보낼 데이터를 출력
		out.println(jsonMain.toJSONString());
		
	}else{
		out.println("Error!");
	}
%>