<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href=" <%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href = "src/css/push.css" rel="stylesheet"/>
</head>

<body>
<% 
int  userid = Integer.parseInt(request.getParameter("user"));
%>

<div class = "push_pad">
<div class = "form-header">修改个人头像</div>

<form class = "myform" action = "/Sysu/ModifyUserImg?user=<%=userid %>" method="post" enctype="multipart/form-data">

<label for = "file">选择头像照片</label>
<div></div>
<input type = "file" id = "file" name = "file"/>
<div></div>


<button type = "submit">确认修改</button>
</form>



</div>
    
    
</body>
</html>