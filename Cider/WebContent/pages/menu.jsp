<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>산속을 샅샅이</title>

    <!-- Bootstrap Core CSS -->
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/Cider/pages/index.jsp"><img src="/Cider/image/bn.png"></a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                    <%
                    	if(session.getAttribute("ID") == null){
                    		%>
                    		<li><a href="/Cider/pages/login.html"><i class="fa fa-sign-in fa-fw"></i> Login</a>
                    		<%
                    	}else{
                    %>
                        <li><a href="/Cider/pages/profile.jsp"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="/Cider/operation/logoutp.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    <%
                    }
                    %>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="/Cider/pages/index.jsp"><i class="fa fa-home fa-fw"></i> 메인</a>
                        </li>                    
                        <li>
                            <a href="#"><i class="fa fa-th-list fa-fw"></i> 게시판<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
								<%
									
										%>
											<li>
												<a href="/Cider/pages/board/vboard.jsp?bcode=1"></i> 공개 게시판</a>
											</li>
										<%
									
								%>
                            </ul>
                        </li>
                        <%
                        if(session.getAttribute("ID") == null){
                        	
                        %>
                        <li>
                            <a href="/Cider/pages/login.html"><i class="fa fa-group fa-fw"></i> 팀 메뉴</a>
                        </li>
                        <%
                        }else{
                        %>
                        <li>
                            <a href="/Cider/pages/team/tindex.jsp"><i class="fa fa-group fa-fw"></i> 팀 메뉴</a>
                        </li>
                        <%
                        }
                        %>

                            <!-- /.nav-second-level -->
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
</div>
</body>

</html>