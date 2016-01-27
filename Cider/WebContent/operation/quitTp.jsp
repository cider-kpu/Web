<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String id = (String)session.getAttribute("ID");
	
	Connection conn=null;

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cider", "root","1234");

	Statement stmt = conn.createStatement();
	Statement stmt2 = conn.createStatement();
		
	int idx = Integer.parseInt(request.getParameter("idx"));
	int gcode = Integer.parseInt(request.getParameter("gcode"));
		
	ResultSet rs = stmt.executeQuery("select * from application where idx="+idx+" and gidx="+gcode);
	rs.next();
		
	if(id.equals(rs.getString("writer"))){
		stmt2.executeUpdate("delete from application where idx="+idx+" and gidx="+gcode);
			
		response.sendRedirect("../pages/teamlist.jsp");
	}else{
		%>
		<script>
			alert('올바르지 않은 접근입니다.');
			location.href="..\\pages\\warticle?bcode="+bcode;
		</script>
		<%
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