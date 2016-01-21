<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">회원가입</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="../operation/signinp.jsp" method="POST">
                            <fieldset>
                                <div class="form-group">
                                    <input name="id" class="form-control" placeholder="E-mail (ID)" type="email" autofocus>
                                </div>
                                <div class="form-group">
                                    <input name="pw" class="form-control" placeholder="Password" type="password">
                                </div>
                                                                <div class="form-group">
                                	<input name="name" class="form-control" placeholder="Name" type="text">
                                </div>
                                <div class="form-group">
                                	<input name="pn" class="form-control" placeholder="Phone-Number" type="text">
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <div class="from-group">
                             	 	<input type="submit" class="btn btn-success btn-lg btn-block" value="Sign in">
                           	    </div>
                           	    <div align=right>
                           	    	<table>
                           	    		<tr>
                           	    			<td><button type="button" class="btn btn-link" ><a href="../pages/login.html">돌아가기</a></button></td>
                           	    		</tr>
                           	    	</table>
                           	    </div>
                            </fieldset>
                        </form>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
</body>
</html>