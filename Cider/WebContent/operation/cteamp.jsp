<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.sql.*"
	import="java.util.*"
	import="java.text.*"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%    
    //제대로 utf-8환경이 아니라 한글 깨짐 그래서 임의로 추가                                                   
    request.setCharacterEncoding("utf-8");
    
    String name = request.getParameter("name");
    if( (name != null && !name.equals("")) ){
    
  		String email = (String)session.getAttribute("ID");
    
    	Connection conn=null;
	
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cider", "root","1234");
		
		Statement stmt = conn.createStatement();
		Statement stmt2 = conn.createStatement();
		Statement stmt3 = conn.createStatement();
		
		ResultSet rs = stmt2.executeQuery("select max(idx) from team");
		rs.next();
		
		int gcode = rs.getInt("max(idx)")+1;
		
		stmt.executeUpdate("update user set gcode="+gcode+", gpwr="+2+" where email='"+email+"'");
		stmt.executeUpdate("insert into team(idx, name, leader) values("+gcode+", '"+name+"', '"+email+"')");
		
		session.setAttribute("GCODE", gcode);
		session.setAttribute("GPWR", 2);
		
		response.sendRedirect("\\Cider\\pages\\index.jsp");
    }    	
		%>
		<script>
			alert('입력되지 않은 데이터가 있습니다.');
			location.href="\\Cider\\pages\\team\\cteam.jsp";
		</script>
		<%	
%>
