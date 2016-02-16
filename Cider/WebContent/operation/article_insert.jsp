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
    
    // 게시판 구분
    int type = 0;
    if(request.getParameter("type") != null){
    	type = Integer.parseInt(request.getParameter("type"));
    }
    
    if( (title != null && !title.equals("")) && (content != null && !content.equals("")) ){
    
  		String email = (String)session.getAttribute("ID");
   		int bcode = Integer.parseInt(request.getParameter("bcode"));
    
   	 	Calendar cal = Calendar.getInstance();
    
  	  	SimpleDateFormat d_format = new SimpleDateFormat("yyyy-MM-dd");
  	  	String date = d_format.format(cal.getTime());
    
    	Connection conn=null;
	
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cider", "root","1234");
	
		Statement stmt = conn.createStatement();
		Statement stmt2 = conn.createStatement();
		Statement stmt3 = conn.createStatement();
	
		ResultSet rs = stmt2.executeQuery("select * from user where email='"+email+"'");
		ResultSet rs2 = stmt3.executeQuery("select max(idx) from article where board="+bcode);
	
		rs2.next();
	
		stmt.executeUpdate("insert into article(idx, subject, writer, contents, date, board) values("+(rs2.getInt("max(idx)")+1)+", '"+title+"', '"+(String)session.getAttribute("ID")+"', '"+content+"', '"+date+"', "+bcode+" )");

		if(type == 0){
			response.sendRedirect("/Cider/pages/board/vboard.jsp?bcode="+bcode);
		}else if(type == 1){
			response.sendRedirect("/Cider/pages/board/vboard.jsp?bcode="+bcode+"&type="+type);
		}
		
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
			location.href="/Cider/pages/board/vboard?bcode="+bcode;
		</script>
		<%	
%>
