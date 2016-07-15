<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="java.text.*"
    import="java.sql.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	//날짜 설정
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	String Tday;
	if( (request.getParameter("year") == null)||(request.getParameter("month") == null)||(request.getParameter("day") == null) ){
		Calendar cal = Calendar.getInstance();
		Tday = sdf.format(cal.getTime());
	}
	else{
		String rmonth = null;
		String rday	= null;
		
		if( (request.getParameter("month").equals("1")||
				request.getParameter("month").equals("2")||
				request.getParameter("month").equals("3")||
				request.getParameter("month").equals("4")||
				request.getParameter("month").equals("5")||
				request.getParameter("month").equals("6")||
				request.getParameter("month").equals("7")||
				request.getParameter("month").equals("8")||
				request.getParameter("month").equals("9")
				) == true )
			rmonth = '0'+request.getParameter("month");
		else rmonth = request.getParameter("month");
		if( (request.getParameter("day").equals("1")||
				request.getParameter("day").equals("2")||
				request.getParameter("day").equals("3")||
				request.getParameter("day").equals("4")||
				request.getParameter("day").equals("5")||
				request.getParameter("day").equals("6")||
				request.getParameter("day").equals("7")||
				request.getParameter("day").equals("8")||
				request.getParameter("day").equals("9")
				) == true)
			rday = '0'+request.getParameter("day");
		else rday = request.getParameter("day");
			
		Tday = request.getParameter("year")+'-'+rmonth+'-'+rday;
	}
	
	//날짜 분할
	String[] tmp;
	StringTokenizer st = new StringTokenizer(Tday,"-");
	String year = st.nextToken();
	String month = st.nextToken();
	String day = st.nextToken();
	
	//DB 커넥션
	Connection conn=null;

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cider", "root","1234");
	
	Statement stmt = conn.createStatement();
	Statement stmt2 = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select count(*) from schedule where date like '%"+Tday+"%' and team="+session.getAttribute("GCODE"));
	rs.next();

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>산속을 샅샅이</title>

</head>

<body>
	<%@include file="../tmenu.jsp" %>


        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                    	<h1 class="page-header">팀 일정</h1>
						<form action="/Cider/pages/team/schedule/scheView.jsp" method="post">
						<%
						if( (Integer)session.getAttribute("GPWR") != 0){
							%>
						<center><input type="text" size="4" name="year" value="<%=year%>" > 년 <input type="text" size="2" name="month" value="<%=month %>" %> 월 <input type="text" size="2" name="day" value="<%=day %>"> 일 <input type="submit" value="검색" class="btn btn-outline btn-primary btn-sm"> <a href="/Cider/pages/team/schedule/scheWrite.jsp?day=<%=Tday %>"><input type="button" value="추가" class="btn btn-outline btn-primary btn-sm"></a></center>
							<%
						}else{
							%>
						<center><input type="text" size="4" name="year" value="<%=year%>" > 년 <input type="text" size="2" name="month" value="<%=month %>" %> 월 <input type="text" size="2" name="day" value="<%=day %>"> 일 <input type="submit" value="검색" class="btn btn-outline btn-primary btn-sm"></center>
							<%
						}
						%>
							
						</form>
							
						<%
							if(rs.getInt("count(*)") == 0){
								out.print("일정이 없습니다.");
							}
							else{
								ResultSet rs2 = stmt2.executeQuery("select * from schedule where date like '%"+Tday+"%' and team="+session.getAttribute("GCODE")+" order by date DESC, time asc");
								for(int i = 0; i < rs.getInt("count(*)"); i++){
									rs2.next();
									%>
									<a href="/Cider/pages/team/schedule/scheView.jsp?idx=<%=rs2.getInt("idx")%>" > <%=rs2.getString("subject") %> <%=rs2.getString("time") %><span class="fa arrow"></span></a>
									<%
								}
								
							}
						%>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    <!-- jQuery -->
    <script src="/Cider/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/Cider/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/Cider/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/Cider/dist/js/sb-admin-2.js"></script>

</body>

</html>
<%

	//커넥션 닫기
	conn.close();
	stmt.close();
	rs.close();

%>