<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.sql.*"
%>
<%
request.setCharacterEncoding("utf-8");
if(session.getAttribute("GPWR") == null || (Integer)session.getAttribute("GPWR") == 0){
	response.sendRedirect("/Cider/pages/index.jsp");
}

if(request.getParameter("name") == null || (request.getParameter("name")).equals("") ){
	response.sendRedirect("/Cider/pages/team/tindex.jsp");
}

Connection conn=null;

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cider", "root","1234");

int idx = Integer.parseInt(request.getParameter("idx"));
String name = request.getParameter("name");

Statement stmt = conn.createStatement();

stmt.executeUpdate("update board set name='"+name+"' where idx="+idx);

response.sendRedirect("/Cider/pages/team/mboard.jsp");

conn.close();
stmt.close();

%>