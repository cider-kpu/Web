<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.sql.*"
	import="java.util.*"
	import="java.text.*"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%    
    //제대로 utf-8환경이 아니라 한글 깨짐 그래서 임의로 추가                                                   
    request.setCharacterEncoding("utf-8");
    
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    if( (title != null && !title.equals("")) && (content != null && !content.equals("")) ){
    
  		String email = (String)session.getAttribute("ID");
   		int gcode = Integer.parseInt(request.getParameter("gcode"));
    
    	Connection conn=null;
	
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cider", "root","1234");
	
		Statement stmt = conn.createStatement();
		Statement stmt2 = conn.createStatement();
		Statement stmt3 = conn.createStatement();
	
		ResultSet rs = stmt2.executeQuery("select count(*) from application where writer='"+email+"'");
		rs.next();
		
		ResultSet rs2 = stmt3.executeQuery("select max(idx) from application where gidx="+gcode);
	
		rs2.next();
	
		stmt.executeUpdate("insert into application(idx, gidx, writer, contents, subject) values("+(rs2.getInt("max(idx)")+1)+", '"+gcode+"', '"+(String)session.getAttribute("ID")+"', '"+content+"', '"+title+"')");

		response.sendRedirect("/Cider/pages/team/teamlist.jsp");
		
		conn.close();
		stmt.close();
		stmt2.close();
		stmt3.close();
		rs.close();
		rs2.close();
    }    	
		%>
		<script>
			alert('입력되지 않은 데이터가 있습니다.');
			location.href="\\Cider\\pages\\team\\waplic?gcode="+idx;
		</script>
		<%	
%>
