 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="org.json.simple.*"
    import="java.sql.*"%>

<%
  	// 데이터를 안드로이드에서 받음
	int score = Integer.parseInt(request.getParameter("score"));
	
	// DB 연결
	Connection conn=null;
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mg01", "root","1234");
	
	
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery("Select * from rank");
	
	
	int rank[] = new int[5];
	int t1,t2;
	int result = 10;
	
	for(int a=0; a<5; a++){
		if(rs.isLast()){
			
			rank[a] = 0;
		
		} else{
			rs.next();
			rank[a] = rs.getInt("score");
		}
	}
	
	if(score >= rank[0]){
		result = 1;
    	t1 = rank[0]; rank[0] = score;
    	t2 = rank[1]; rank[1] = t1;
    	t1 = rank[2]; rank[2] = t2;
    	t2 = rank[3]; rank[3] = t1;
    	rank[4] = t2;
	}else if(score >= rank[1]){
		result = 2;
    	t2 = rank[1]; rank[1] = score;
    	t1 = rank[2]; rank[2] = t2;
    	t2 = rank[3]; rank[3] = t1;
    	rank[4] = t2;
	}else if(score >= rank[2]){
		result = 3;
    	t1 = rank[2]; rank[2] = score;
    	t2 = rank[3]; rank[3] = t1;
    	rank[4] = t2;
	}else if(score >= rank[3]){
		result = 4;
    	t2 = rank[3]; rank[3] = score;
    	rank[4] = t2;
	}else if(score >= rank[4]){
		result = 5;
		rank[4] = score;
	}else {
		result = 6;
	}
	
	Statement stmt2 = conn.createStatement();
	
	if (result <= 5){
		for(int a=0; a<5; a++){
			stmt2.executeUpdate("update set score="+rank[a]+" where rank="+(a+1)+")");
		}
		out.print(result);
	}else {
		out.print("6");
	}
	
	rs.close();
	conn.close();
	stmt.close();
	stmt2.close();
%>