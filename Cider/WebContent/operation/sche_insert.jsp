<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.sql.*"
	import="java.util.*"
	import="java.text.*"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%    
    //제대로 utf-8환경이 아니라 한글 깨짐 그래서 임의로 추가                                                   
    request.setCharacterEncoding("UTF-8");
    
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    String day = request.getParameter("day");
    String time = request.getParameter("hour")+':'+request.getParameter("min")+":00";
    
    
    
    // 게시판 구분
    if( (title != null && !title.equals("")) && (content != null && !content.equals("")) ){
    
   		int bcode = (Integer)session.getAttribute("GCODE");
    
   	 	Calendar cal = Calendar.getInstance();
   	 	
    	Connection conn=null;
	
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cider", "root","1234");
	
		Statement stmt = conn.createStatement();
		Statement stmt2 = conn.createStatement();
		
		ResultSet rs = stmt2.executeQuery("select max(idx) from schedule where team like '"+(String)session.getAttribute("BCODE")+"'");
		rs.next();
		stmt.executeUpdate("insert into schedule(idx, date, time, subject, contents, team) values('"+(rs.getInt("max(idx)")+1)+"','"+day+"', '"+time+"', '"+title+"', '"+content+"', '"+bcode+"'); ");

		response.sendRedirect("/Cider/pages/team/schedule/scheView.jsp");

		conn.close();
		stmt.close();
		stmt2.close();
		rs.close();
		
    }    	
		%>
		<script>
			alert('입력되지 않은 데이터가 있습니다.');
			location.href="/Cider/pages/team/schedule/scheView.jsp";
		</script>
		<%	
%>
