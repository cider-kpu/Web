<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int bcode = Integer.parseInt(request.getParameter("bcode"));	
	int type=0;
	
	if(request.getParameter("type") != null){
		type = Integer.parseInt(request.getParameter("type"));
	}
	
	Statement stmt;
	
	ResultSet rs;
	
	Connection conn=null;

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cider", "root","1234");
	
	stmt = conn.createStatement();
	
	rs = stmt.executeQuery("select * from article where board="+bcode+" and idx="+idx);
	rs.next();
	
	String id = (String)session.getAttribute("ID");
	if(id == null) id = "guest";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>산속을 샅샅이</title>

    <!-- Bootstrap Core CSS -->
    <link href="/Cider/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/Cider/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/Cider/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/Cider/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
	<%
	if(type == 0){
	%>
	<%@include file="..\menu.jsp" %>
	<%
	}else{
	%>
	<%@include file="/pages/team/tmenu.jsp" %>
	<%
	}
	%>
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                    <br>
                                            <div class="panel panel-default">
                        <div class="panel-heading">
                        	<%=rs.getString("subject") %>
                        </div>
                        <div class="panel-body">
							<%=rs.getString("contents") %>
							<p class="lead" align=right><%=rs.getString("writer") %></p><p align=right><%=rs.getString("date") %></H5></p>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <%
                    if(id.equals(rs.getString("writer"))){
                    	if(type == 0){
                    		%>
                    		<div align=right><a href="/Cider/pages/board/amodify.jsp?bcode=<%=bcode %>&idx=<%=idx %>"><button type="button" class="btn btn-default">수정</button></a> <a href="/Cider/operation/adelete.jsp?bcode=<%=bcode %>&idx=<%=idx %>"><button type="button" class="btn btn-default">삭제</button></a> <a href="/Cider/pages/board/vboard.jsp?bcode=<%=bcode %>"><button type="button" class="btn btn-default">목록</button></a></div>
                    		<%
                    	}else if(type == 1){
                    		%>
                    		<div align=right><a href="/Cider/pages/board/amodify.jsp?bcode=<%=bcode %>&idx=<%=idx %>&type=<%=type %>"><button type="button" class="btn btn-default">수정</button></a> <a href="/Cider/operation/adelete.jsp?bcode=<%=bcode %>&idx=<%=idx %>&type=<%=type %>"><button type="button" class="btn btn-default">삭제</button></a> <a href="/Cider/pages/board/vboard.jsp?bcode=<%=bcode %>&type=<%=type %>"><button type="button" class="btn btn-default">목록</button></a></div>
                    		<%
                    	}
                    }else{
                    	%>
                    	<div align=right><a href="/Cider/pages/board/vboard.jsp?bcode=<%=bcode %>"><button type="button" class="btn btn-default">목록</button></a>
                    	<%
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

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/Cider/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/Cider/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/Cider/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/Cider/dist/js/sb-admin-2.js"></script>

</body>
<%
	conn.close();
	stmt.close();
	rs.close();
%>
</html>
