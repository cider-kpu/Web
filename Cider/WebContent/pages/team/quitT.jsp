<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String id = (String)session.getAttribute("ID");

	if(id == null){
		%>
		<script>
		location.href="/Cider/pages/login.html"
		</script>
		<%
	}
	Statement stmt;
	Connection conn=null;
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cider", "root","1234");

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
<%@include file=".\tmenu.jsp" %>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading" align="center">
                        <h3 class="panel-title">정말 탈퇴하시겠습니까?</h3>
                    </div>
                  	<div class="panel-body">
                    	<form role="form" action="/Cider/operation/loginp.jsp" method="POST">
                            <fieldset>
                               	<!-- Change this to a button or input when using this as a form -->
                              	<div class="from-group">
                             	  		<table>
                           	   				<tr>
                             	 		 		<td align=left><a href="/Cider/operation/quitTp.jsp" class="btn btn-primary btn-lg">네</a></td>
                             	 		 		<td>        </td>
                             	 		 		<td align=right><a href="/Cider/pages/team/tindex.jsp" class="btn btn-default btn-lg" >아니오</a></td>
                          	     			</tr>
                           	    	</table>
                           	    </div>
                            </fieldset>
                    	</form>
                    </div>
                </div>
            </div>
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

%>
</html>
