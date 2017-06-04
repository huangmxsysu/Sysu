<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="<%=basePath%>src/jquery2/jquery.min.js"></script>
<script src="<%=basePath%>src/bootstrap3/js/bootstrap.min.js"></script>
<link href="<%=basePath%>src/css/index.css" rel="stylesheet">
<%-- <link href="<%=basePath%>src/bootstrap3/css/bootstrap.min.css"
	rel="stylesheet"> --%>