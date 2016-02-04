<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.sql.*"
	import="java.util.*"
	import="java.text.*"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%    
    //제대로 utf-8환경이 아니라 한글 깨짐 그래서 임의로 추가                                                   
    request.setCharacterEncoding("utf-8");
    
    String name = (String)request.getParameter("name");
    if( (name != null && !name.equals("")) ){
    
   		int gcode = (Integer)session.getAttribute("GCODE");
    
    	Connection conn=null;
	
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cider", "root","1234");
	
		Statement stmt = conn.createStatement();
		Statement stmt2 = conn.createStatement();
		Statement stmt3 = conn.createStatement();
		
		ResultSet rs2 = stmt.executeQuery("Select count(*) from board where gidx="+gcode);
		rs2.next();
		
		if(rs2.getInt("count(*)") != 10 ){
			ResultSet rs = stmt.executeQuery("Select max(idx) from board");
			rs.next();
			stmt3.executeUpdate("insert into board(idx, gidx, name) values("+(rs.getInt("max(idx)") + 1)+", "+gcode+", '"+name+"')");
			rs.close();
		}else{
			%>
			<script>
				alert('게시판이 너무 많습니다.');
				location.href="/Cider/pages/team/mboard.jsp";
			</script>
			<%
		}
		
		response.sendRedirect("/Cider/pages/team/mboard.jsp");
		
		conn.close();
		stmt.close();
		stmt2.close();
		stmt3.close();
		rs2.close();
    }
%>
	<script>
		alert('입력되지 않은 데이터가 있습니다.');
		location.href="\\Cider\\pages\\team\\waplic?gcode="+idx;
	</script>

<html>
</html>