<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<head>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    System.out.println("base:"+basePath);
%>
<base href="<%=basePath%>">
<jsp:include page="../site/headinfo.jsp" />
<title>物品详情页</title>

<link href = "src/css/pad.css" rel="stylesheet"/>

</head>
<body>
	<jsp:include page="../site/personal_header.jsp" />
	
	<div class = "pad_pad">
		<div class = "pad_header">物品详情页</div>
		
	</div>
	
	

    <jsp:include page="../site/footer.jsp" />
</body>
</html>