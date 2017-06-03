<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language="java" %> 
    <%@ page import="java.sql.*"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href=" <%=basePath%>">

<jsp:include page="../site/headinfo.jsp" />

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>登陆--中大闲置</title>

<link href="src/css/sign.css" rel="stylesheet">

</head>
<body>

  <div class="box">
    <div class="pad">
      <div class="form-header">登陆界面</div>
      <form class = "myform" action="#" >
        <label for="username">账号：</label>
        <input type = "text" id = "username" placeholder="邮箱地址" required/>
        <div></div>
        <label for="password">密码：</label>
        <input tpye = "text" id = "password" placeholder="密码" required/>
        <button type = "submit">登陆</button>
      </form>

    </div>
  </div>

</body>
</html>