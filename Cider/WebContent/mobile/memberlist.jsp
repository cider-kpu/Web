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
	
	ResultSet rs = stmt.executeQuery("Select * from user where email='"+id+"'");
	rs.next();
	
	
	// 팀 확인
	if(rs.getInt("gcode") == 0)
		out.print("가입된 팀이 없습니다.");
	else{
		int gcode = rs.getInt("gcode");
		rs = stmt.executeQuery("Select * from user where gcode="+gcode);
		rs.next();
		
		// 출력부분
		while(true){ 
			if(rs.isLast()){
				
				out.print(rs.getString("email")+" "+rs.getString("name")+" "+rs.getString("pn"));
				out.newLine();
				break;
			} else { 
				out.print(rs.getString("email")+" "+rs.getString("name")+" "+rs.getString("pn"));
				out.newLine();
				rs.next();
			}
		}
	}
	
	conn.close();
	stmt.close();
	rs.close();
%>