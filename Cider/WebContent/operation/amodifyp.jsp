<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%    
    //제대로 utf-8환경이 아니라 한글 깨짐 그래서 임의로 추가                                                   
    request.setCharacterEncoding("utf-8");
    
	String id = (String)session.getAttribute("ID");

	if(id == null){
		%>
		<script>
		location.href="/Cider/pages/login.html"
		</script>
		<%
	}
	
	
	int type;
	if(request.getParameter("type") != null ){
		type = Integer.parseInt(request.getParameter("type"));
	}else{
		type = 0;
	}
	
	Connection conn=null;

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cider", "root","1234");

	Statement stmt = conn.createStatement();
	Statement stmt2 = conn.createStatement();
	
	if(type == 1){
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		int gcode = Integer.parseInt(request.getParameter("gcode"));
		
		ResultSet rs = stmt.executeQuery("select * from application where idx="+idx+" and gidx="+gcode);
		rs.next();
	
		String title = null;
		String content = null;
	
		if(id.equals(rs.getString("writer"))){
		
			title = (String)request.getParameter("title");
			content = (String)request.getParameter("content");
		
			stmt2.executeUpdate("update application set subject='"+title+"', contents='"+content+"' where idx="+idx+" and gidx="+gcode);
			response.sendRedirect("/Cider/pages/team/vaplic.jsp?idx="+idx+"&gcode="+gcode);
		}else{
			%>
			<script>
				alert('올바르지 않은 접근입니다.');
				location.href="\\Cider\\pages\\index.jsp";
			</script>
			<%
		}
	}else{
	
		int idx = Integer.parseInt(request.getParameter("idx"));
		int bcode = Integer.parseInt(request.getParameter("bcode"));
		
		ResultSet rs = stmt.executeQuery("select * from article where idx="+idx+" and board="+bcode);
		rs.next();
	
		String title = null;
		String content = null;
	
		if(id.equals(rs.getString("writer"))){
		
			title = (String)request.getParameter("title");
			content = (String)request.getParameter("content");
		
			stmt2.executeUpdate("update article set subject='"+title+"', contents='"+content+"' where idx="+idx+" and board="+bcode);
			response.sendRedirect("/Cider/pages/board/vboard.jsp?bcode="+bcode);
		}else{
			%>
			<script>
				alert('올바르지 않은 접근입니다.');
				location.href="\\Cider\\pages\\board\\warticle?bcode="+bcode;
			</script>
			<%
		}
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>