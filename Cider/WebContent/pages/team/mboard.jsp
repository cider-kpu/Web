<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%

	if( session.getAttribute("GPWR") == null || (((String)session.getAttribute("ID")).equals("") == true || session.getAttribute("ID") == null) ){
		%>
		<script>
		alert('잘못된 접근입니다.');
		location.href="/Cider/pages/index.html";
		</script>
		<%
	}

	int id = (Integer)session.getAttribute("GCODE");	
	
	Statement stmt;
	Statement stmt3;
	
	ResultSet rs;
	ResultSet rs3;
	
	
	Connection conn=null;

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cider", "root","1234");
	
	stmt = conn.createStatement();
	stmt3 = conn.createStatement();
	
	rs3 = stmt3.executeQuery("select count(*) from board where gidx="+id);
	rs3.next();
	
	
	//페이징 처리
	int cpage;
	int cblock;
	int tpage;
	int tblock;
	int sta_idx;
	
	tpage = (rs3.getInt("count(*)") % 10) == 0 ? rs3.getInt("count(*)")/10 : (rs3.getInt("count(*)") / 10) + 1;
	tblock = tpage % 5 == 0 ? tpage / 5 : (tpage / 5) + 1;
	
	if( request.getParameter("pidx") == null || Integer.parseInt(request.getParameter("pidx")) == 1){
		cpage = 1;
		cblock = 1;
		
		sta_idx = (cpage - 1) * 10;
		
		if(cpage == tpage){
			
			rs = stmt.executeQuery("select * from board where gidx="+id+" ORDER BY idx DESC limit "+sta_idx+","+rs3.getInt("count(*)"));
		}else{
			rs = stmt.executeQuery("select * from board where gidx="+id+" ORDER BY idx DESC limit "+sta_idx+","+(sta_idx+10));
		}
	}else{
		cpage = Integer.parseInt(request.getParameter("pidx"));
		cblock = cpage % 5 == 0 ? cpage / 5 : (cpage / 5) + 1;
		
		sta_idx = (cpage - 1) * 10;
		
		if(cpage == tpage){
			
			rs = stmt.executeQuery("select * from board where gidx="+id+" ORDER BY idx DESC limit "+sta_idx+","+(rs3.getInt("count(*)")-sta_idx));
		}else{
			rs = stmt.executeQuery("select * from board where gidx="+id+" ORDER BY idx DESC limit "+sta_idx+","+sta_idx+9);
		}
	}
	
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
                    <div class="col-lg-12">
                        <h1 class="page-header">게시판 목록</h1>
                       	<table class="table table-hover">
                        	<thead>
                                <tr>
                                   	<th ></th>
                                   	<th ></th>
                                   	<th ></th>
                                </tr>
                            </thead>
                            
                            <tbody>
                            <% 
                            	int b = (cpage == tpage) ? rs3.getInt("count(*)")-sta_idx : 10;
                            	for(int a=0 ; a < b; a++){
                            		if(rs3.getInt("count(*)") == 0) {
                            			%>
                            			
                            			<tr>
                            				<td></td>
                            				<td>게시판이 없습니다</td>
                            			</tr>
                            			<%
                            			break;
                            		}
                            		rs.next();
                            		%>
                            			<tr>
                            				<td align="center"><a href="#"><%=rs.getString("name") %></a></td>
                            				<td align="right"><form action="/Cider/operation/modifyboard.jsp?idx=<%=rs.getInt("idx") %>" method="post"><input type="text" placeholder="Rename" name="name"></td>
                            				<td align="right"><input type="submit" class="btn btn-outline btn-primary btn-xs" value="수정하기"></form> <a href="/Cider/operation/deleteboard.jsp?idx=<%=rs.getInt("idx") %>" class="btn btn-outline btn-primary btn-xs">삭제하기</a></td>
                            			</tr>
                            		<%
                            	}
                            %>
                            </tbody>
                        </table>
                        
                        <div align=center>
                        
                        <%
                        
                        if(tblock != 1 && cblock != 1){
                        	%>
                        	 <a href="/Cider/pages/team/mboard.jsp?pidx=<%=cpage - (cpage % 5)%>"> [&lt;&lt;] </a>
                        	<%
                        }
                        
                        
                        int bpage = (cblock == tblock) ? tpage - ((cblock-1) * 5): 5;
                        int tmp = (cblock - 1) * 5 + 1;
                      	%>
                      	<div align=right><form action="/Cider/operation/addboard.jsp" method="post"><input type="text" placeholder="New-name" name="name" id="name"> <input type="submit" class="btn btn-default" value="추가"></form></div>
                      	<%
                      	if(rs3.getInt("count(*)") != 0){ //page 표시 에러
                      		
                        for(int a=0; a < bpage; a++){
                        	if (tmp+a == cpage){
                       			%>
                        		<b>[<%=tmp+a %>]</b>
                      			<%
                        	}
                        	else{
                                %>
                                <a href="/Cider/pages/team/mboard.jsp?pidx=<%=tmp+a %>">[<%=tmp+a %>]</a>
                              	<%
                        	}
                        }

                        if(tblock != 1 && cblock != tblock && cpage % 5 == 0){
                        	%>
                        		<a href="/Cider/pages/team/mboard.jsp?pidx=<%=cpage + 1%>"> [&gt;&gt;] </a>
                        	<%
                        }else if(tblock != 1 && cblock != tblock){
                        	%>
                      	 		<a href="/Cider/pages/team/mboard.jsp?pidx=<%=cpage + (6 - (cpage % 5))%>"> [&gt;&gt;] </a>
                      	 	<%
                        }
                        
                      	}
                      	%>
                		
                      	</div>
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
	stmt3.close();
	rs.close();
	rs3.close();
	
%>
</html>
