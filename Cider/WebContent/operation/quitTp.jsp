<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String id = (String)session.getAttribute("ID");
	if(id == null){
		%>
		<script>
			alert('올바르지 않은 접근입니다.');
			location.href="\\Cider\\pages\\index.jsp";
		</script>
		<%
	}
	Connection conn=null;

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cider", "root","1234");

	Statement stmt = conn.createStatement();
	
	
	int idx = (Integer)session.getAttribute("GCODE");
		
	ResultSet rs = stmt.executeQuery("select * from team where idx="+idx);
	rs.next();
		
	if( (rs.getString("leader")).equals(id) ){
		Statement stmt3 = conn.createStatement();
		ResultSet rs2 = stmt3.executeQuery("select count(*) from user where gcode="+idx);
		rs2.next();
		if (rs2.getInt("count(*)") == 1){
			Statement stmt2 = conn.createStatement();
			Statement stmt4 = conn.createStatement();
			
			stmt2.executeUpdate("update user set gcode=0, gpwr=0 where gcode="+idx);
			stmt4.executeUpdate("delete from team where idx="+idx);
			
			session.setAttribute("GCODE", 0);
			session.setAttribute("GPWR", 0);
			
			stmt2.close();
			stmt4.close();
			
			response.sendRedirect("/Cider/pages/index.jsp");
		}else{
			%>
			<script>
				alert('다른 회원이 존재합니다. 리더를 바꾸거나 다른 회원이 없어야 합니다.');
				location.href="/Cider/pages/team/index.jsp";
			</script>
			<%	
		}
		
		stmt3.close();
		rs2.close();
	}
	
	conn.close();
	stmt.close();
	rs.close();
	

%>
<html>
</html>