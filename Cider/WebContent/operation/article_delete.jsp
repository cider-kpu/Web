<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String id = (String)session.getAttribute("ID");
	
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
		
	int idx = Integer.parseInt(request.getParameter("idx"));
	int bcode = Integer.parseInt(request.getParameter("bcode"));
		
	ResultSet rs = stmt.executeQuery("select * from article where idx="+idx+" and board="+bcode);
	rs.next();
		
	if(id.equals(rs.getString("writer"))){
		
		stmt2.executeUpdate("delete from article where idx="+idx+" and board="+bcode);
		
		if(type == 0){
			response.sendRedirect("/Cider/pages/board/vboard.jsp?bcode="+bcode);
		}else{
			response.sendRedirect("/Cider/pages/board/vboard.jsp?bcode="+bcode+"&type=1");
		}
	}else{
		%>
		<script>
			alert('올바르지 않은 접근입니다.');
			location.href="\\Cider\\pages\\board\\warticle?bcode="+bcode;
		</script>
		<%
	}

	conn.close();
	stmt.close();
	stmt2.close();
	rs.close();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>