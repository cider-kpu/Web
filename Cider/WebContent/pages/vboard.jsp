<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	request.setCharacterEncoding("utf-8");

	int id = Integer.parseInt(request.getParameter("bcode"));	
	
	Statement stmt;
	Statement stmt2;
	Statement stmt3;
	
	ResultSet rs;
	ResultSet rs2;
	ResultSet rs3;
	
	Connection conn=null;

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cider", "root","1234");
	
	stmt = conn.createStatement();
	stmt2 = conn.createStatement();
	stmt3 = conn.createStatement();
	
	String search = null;
	
	if(request.getParameter("search") == null){
		rs3 = stmt3.executeQuery("select count(*) from article where board="+id);
	}else{
		if( request.getMethod() == "GET" ){
			search =(String)request.getParameter("search");
			search = new String(search .getBytes("8859_1"), "UTF-8");
		}else
		search =(String)request.getParameter("search");
		rs3 = stmt3.executeQuery("select count(*) from article where subject like '%"+search+"%' and board="+id);
	}
	
	rs2 = stmt2.executeQuery("select * from board where idx="+id);
	
	rs2.next();
	rs3.next();
	
	String name = rs2.getString("name");
	
	//페이징 처리
	int cpage;  // 현재 페이지
	int cblock; // 현재 블록
	int tpage;	// 전체 페이지
	int tblock;	// 전체 블록
	int sta_idx;// 게시글 시작 인덱스
	
	tpage = (rs3.getInt("count(*)") % 10) == 0 ? rs3.getInt("count(*)")/10 : (rs3.getInt("count(*)") / 10) + 1;
	tblock = tpage % 5 == 0 ? tpage / 5 : (tpage / 5) + 1;
	
	if( request.getParameter("pidx") == null || Integer.parseInt(request.getParameter("pidx")) == 1){
		cpage = 1;
		cblock = 1;
		
		sta_idx = (cpage - 1) * 10;
		
		if(cpage == tpage){
			if(search == null || search.equals("") == true){
				rs = stmt.executeQuery("select * from article where board="+id+" ORDER BY idx DESC limit "+sta_idx+","+rs3.getInt("count(*)"));
			}else{
				rs = stmt.executeQuery("select * from article where subject like '%"+search+"%' and board="+id+" ORDER BY idx DESC limit "+sta_idx+","+rs3.getInt("count(*)"));
			}
			
		}else{
			if(search == null || search.equals("") == true){
				rs = stmt.executeQuery("select * from article where board="+id+" ORDER BY idx DESC limit "+sta_idx+","+(sta_idx+10));
			}else{
				rs = stmt.executeQuery("select * from article where subject like '%"+search+"%' and board="+id+" ORDER BY idx DESC limit "+sta_idx+","+(sta_idx+10));
			}
			
		}
	}else{
		cpage = Integer.parseInt(request.getParameter("pidx"));
		cblock = cpage % 5 == 0 ? cpage / 5 : (cpage / 5) + 1;
		
		sta_idx = (cpage - 1) * 10;
		
		if(cpage == tpage){
			if(search == null || search.equals("") == true){
				rs = stmt.executeQuery("select * from article where board="+id+" ORDER BY idx DESC limit "+sta_idx+","+(rs3.getInt("count(*)")-sta_idx));
			}else{
				rs = stmt.executeQuery("select * from article where subject like '%"+search+"%' and board="+id+" ORDER BY idx DESC limit "+sta_idx+","+(rs3.getInt("count(*)")-sta_idx));
			}
			
		}else{
			if(search == null || search.equals("") == true){
				rs = stmt.executeQuery("select * from article where board="+id+" ORDER BY idx DESC limit "+sta_idx+","+sta_idx+9);
			}else{
				rs = stmt.executeQuery("select * from article where subject like '%"+search+"%' and board="+id+" ORDER BY idx DESC limit "+sta_idx+","+sta_idx+9);
			}
			
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
<%@include file="..\pages\menu.jsp" %>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"><%=name %></h1>
                       	<table class="table table-hover">
                        	<thead>
                                <tr>
                                    <th width=50>#</th>
                                   	<th >Subject</th>
                                    <th align="center" width=80>User</th>
                                    <th>date</th>
                                </tr>
                            </thead>
                            
                            <tbody>
                            <% 
                            	int b = (cpage == tpage) ? rs3.getInt("count(*)")-sta_idx : 10;
                            	
                            	for(int a=0 ; a < b; a++){
                            		if(rs3.getInt("count(*)") == 0 || rs.isLast() == true || rs == null) break;
                            		else{
                            		
                            		rs.next();
                            		
                            		%>
                            			<tr>
                            				<td><%=rs.getInt("idx") %></td>
                            				<td><a href="..\pages\varticle.jsp?idx=<%=rs.getInt("idx") %>&bcode=<%=id %>"><%=rs.getString("subject") %></a></td>
                            				<td><%=rs.getString("writer") %></td>
                            				<td><%=rs.getString("date") %></td>
                            			</tr>
                            		<%
                            		}
                            	}
                            %>
                            </tbody>
                        </table>
                        
                        <div align=center>
                        
                        <%
                        
                        if(tblock != 1 && cblock != 1){
                        	
                        	if(search == null || search.equals("") == true){
                        	%>
                        	 <a href="..\pages\vboard.jsp?pidx=<%=cpage - (cpage % 5)%>&bcode=<%=id %>"> [&lt;&lt;] </a>
                        	<%
                        	}else{
                            	%>
                          		 <a href="..\pages\vboard.jsp?search=<%=search %>&pidx=<%=cpage - (cpage % 5)%>&bcode=<%=id %>"> [&lt;&lt;] </a>
                          		<%
                        	}
                        }
                        	
                        
                        int bpage = (cblock == tblock) ? tpage - ((cblock-1) * 5): 5;
                        int tmp = (cblock - 1) * 5 + 1;
                        
                        for(int a=0; a < bpage; a++){
                        	if (tmp+a == cpage){
                       			%>
                        		<b>[<%=tmp+a %>]</b>
                      			<%
                        	}
                        	else{
                        		
                        		if(search == null || search.equals("") == true){
                                %>
                                <a href="..\pages\vboard.jsp?pidx=<%=tmp+a %>&bcode=<%=id %>">[<%=tmp+a %>]</a>
                              	<%
                        		}else{
                                    %>
                                    <a href="..\pages\vboard.jsp?search=<%=search %>&pidx=<%=tmp+a %>&bcode=<%=id %>">[<%=tmp+a %>]</a>
                                  	<%
                        		}
                        	}
                        }
                      	
                        if(tblock != 1 && cblock != tblock && cpage % 5 == 0){
                        	if(search == null || search.equals("") == true){
                        	%>
                        		<a href="..\pages\vboard.jsp?pidx=<%=cpage + 1%>&bcode=<%=id %>"> [&gt;&gt;] </a>
                        	<%
                        	}else{
                            	%>
                        			<a href="..\pages\vboard.jsp?search=<%=search %>&pidx=<%=cpage + 1%>&bcode=<%=id %>"> [&gt;&gt;] </a>
                        		<%
                        	}
                        }else if(tblock != 1 && cblock != tblock){
                        	if(search == null || search.equals("") == true){
                        	%>
                      	 		<a href="..\pages\vboard.jsp?pidx=<%=cpage + (6 - (cpage % 5))%>&bcode=<%=id %>"> [&gt;&gt;] </a>
                      	 	<%
                        	}else{
                            	%>
                      	 			<a href="..\pages\vboard.jsp?search=<%=search %>&pidx=<%=cpage + (6 - (cpage % 5))%>&bcode=<%=id %>"> [&gt;&gt;] </a>
                      	 		<%
                        	}
                        }
                      	%>
                
                      	</div>
                      	<div align="center">
                      	<%
                      		if(search == null || search.equals("") == true){
                      			%>
                      		<form action="../pages/vboard.jsp?bcode=<%=id%>" method="post">
                      			<input type="text" name="search" id="search"> <input type="submit" value="검색">
                     	 	</form>
                      			<%
                      		}else{
                      			%>
                      		<form action="../pages/vboard.jsp?bcode=<%=id%>" method="post">
                      			<input type="text" name="search" id="search" value="<%=search%>"> <input type="submit" value="검색">
                     	 	</form>
                      			<%
                      		}
                      	%>
						</div>
                      	
                      	<div align=right><a class="btn btn-default" href="./warticle.jsp?bcode=<%=id %>">글쓰기</a></div>
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
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>
<%
	conn.close();
	stmt.close();
	stmt2.close();
	stmt3.close();
	rs.close();
	rs2.close();
	rs3.close();
	
%>
</html>
