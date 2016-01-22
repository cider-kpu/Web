<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*" %>
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
                <a class="navbar-brand" href="..\pages\index.jsp">산속을 샅샅이</a>
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
                    		<li><a href="..\pages\login.html"><i class="fa fa-sign-in fa-fw"></i> Login</a>
                    		<%
                    	}else{
                    %>
                        <li><a href="../pages/profile.jsp"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="..\operation\logoutp.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
                            <a href="..\pages\index.jsp"><i class="fa fa-home fa-fw"></i> 메인</a>
                        </li>                    
                        <li>
                            <a href="#"><i class="fa fa-th-list fa-fw"></i> 게시판<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
								<%
									
										%>
											<li>
												<a href="..\pages\vboard.jsp?bcode=1"></i> 공개 게시판</a>
											</li>
										<%
									
								%>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-group fa-fw"></i> 팀 메뉴<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                            <%
                            if( session.getAttribute("GCODE") != null && session.getAttribute("GLEAD") != null){
                        		%>
                        		<li>
                        			<a href="#"> 팀 관리</a>
                        		</li>
                        		<li>
                        			<a href="#"> 맴버 관리<span class="fa arrow"></span></a>
                        			<ul class="nav nav-third-level">
                        			<li>
                        				<a href="#"> 가입 신청 목록</a>
                        			</li>
                        			<li>
                        				<a href="#"> 회뭔 록록</a>
                        			</li>
                        			</ul>
                        		</li>
                       `	</ul>
                        		<%
                        	}else if( session.getAttribute("ID") == null){
                            		%>
                            	<li>
                            		<a href="../pages/login.html">로그인</a>
                            	</li>
                            </ul>
                            		<%
                            	}else{
                            		%>
                            	<li>
                            		<a href="#"> 팀 가입하기</a>
                            	</li>
                            	<li>
                            		<a href="#"> 팀 만들기</a>
                            	</li>
                            </ul>
                            		<%
                            	}
                            %>
                        </li>
                        <li>
                            <a href="..\pages\forms.html"><i class="fa fa-edit fa-fw"></i> Forms</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> UI Elements<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="..\pages\panels-wells.html">Panels and Wells</a>
                                </li>
                                <li>
                                    <a href="..\pages\buttons.html">Buttons</a>
                                </li>
                                <li>
                                    <a href="..\pages\notifications.html">Notifications</a>
                                </li>
                                <li>
                                    <a href="..\pages\typography.html">Typography</a>
                                </li>
                                <li>
                                    <a href="..\pages\icons.html"> Icons</a>
                                </li>
                                <li>
                                    <a href="..\pages\grid.html">Grid</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> Multi-Level Dropdown<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">Second Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Second Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Third Level <span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                    </ul>
                                    <!-- /.nav-third-level -->
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="..\pages\blank.jsp">Blank Page</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
</div>
</body>

</html>