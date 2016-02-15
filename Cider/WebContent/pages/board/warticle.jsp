<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String id = (String)session.getAttribute("ID");
	int type=0;
	
	if(id == null){
		%>
		<script>
		location.href="/Cider/pages/login.html"
		</script>
		<%
	}
	if(request.getParameter("type") != null){
		type = Integer.parseInt(request.getParameter("type"));
	}
	int bcode = Integer.parseInt(request.getParameter("bcode"));
	
	Statement stmt;
	Connection conn=null;
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cider", "root","1234");

	stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery("select * from user where email='"+id+"'");
	
	rs.next();
	
	String name;
	String email;
	String pn;
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
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/Cider/editor/js/HuskyEZCreator.js"></script>

<!-- 에티터 스크립트 -->
<script type="text/javascript">
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "/Cider/editor/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : false,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 form 전송
      $("#save").click(function(){
          oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
          $("#frm").submit();
      });    
});
</script>
<script type="text/javascript" src="./quick_photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"> </script>

</head>

<body>
<%
if(type == 0){
	%>
	<%@include file="..\menu.jsp" %>
	<%
}else if(type == 1){
	%>
	<%@include file="../team/tmenu.jsp" %>
	<%
}
%>
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                    <h1 class="page-header">글 쓰기</h1>
                    <%
                    if(type == 0){
                    %>
						<form id="frm" action="/Cider/operation/insert.jsp?bcode=<%=bcode %>" method="post" >
					<%
                    }else if(type == 1){
					%>
						<form id="frm" action="/Cider/operation/insert.jsp?bcode=<%=bcode %>&type=<%=type %>" method="post" >
					<%
					} 
					%>
							<table width="100%">
								<tr>
									<td>제목</td>
									<td><input type="text" id="title" name="title" style="width:650px"/></td>
								</tr>
								<tr>
									<td>내용</td>
									<td>
									<textarea rows="10" cols="30" id="ir1" name="content" style="width:650px; height:350px; "></textarea>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<input type="button" class="btn btn-default" id="save" value="완료"/>
										<a href="/Cider/pages/board/vboard.jsp?bcode=<%=bcode %>"><button type="button" class="btn btn-default">취소</button></a>
									</td>
								</tr>
							</table>
						</form>
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
