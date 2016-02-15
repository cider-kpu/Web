<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.sql.*"
%>
<%

if(session.getAttribute("GPWR") == null || (Integer)session.getAttribute("GPWR") == 0){
	response.sendRedirect("/Cider/pages/index.jsp");
}

if(request.getParameter("idx") == null){
	response.sendRedirect("/Cider/pages/team/tindex.jsp");
}

Connection conn=null;

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cider", "root","1234");

int idx = Integer.parseInt(request.getParameter("idx"));

Statement stmt = conn.createStatement();

stmt.executeUpdate("delete from article where board="+idx);
stmt.executeUpdate("delete from board where idx="+idx);

response.sendRedirect("/Cider/pages/team/mboard.jsp");
%>