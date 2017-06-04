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
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>注册-中大闲置</title>

<link href="src/css/sign.css" rel="stylesheet">

</head>
<body>
<jsp:include page="../site/header.jsp"  flush="true" />


  <div class="box">
    <div class="pad">
      <div class="form-header">注册界面</div>
      <form class = "myform" method="post" action="user/register" >
        <label for="username">账号：</label>
        <input type = "text" id = "username" name = "username" placeholder="995304572@qq.com" required/>
        <div></div>
        <label for="password">密码：</label>
        <input tpye = "password" id = "password" name = "password" placeholder="密码" required/>
        <div></div>
        <label for="repeat_password">确认：</label>
        <input tpye = "password" id = "repeat_password" name = "repeat_password" placeholder="确认密码" required/>
        <div></div>
        <label for="stu_num">学号：</label>
        <input tpye = "text" id = "stu_num" name = "stu_num" placeholder="14348040" required/>
        <div></div>
        <label for="name">姓名：</label>
        <input tpye = "text" id = "name" name = "name" placeholder="黄某某" required/>
        <div></div>
        <input type = "checkbox" id = "agree" name = "agree"/>
        <div id = "agreement">我已经阅读了<a id = "agree-link" href = "user/agreement.jsp" target = "_blank">《用户协议》</a></div>
        <button type = "submit">注册</button>
      </form>
	
    </div>
    <%
	if(request.getAttribute("isRegister")!=null){
	%>
	<div class = "myinfo-danger">
	<%if(!request.getAttribute("isEmail").equals("")){
	    out.print(request.getAttribute("isEmail")+"<br />");}
	if(!request.getAttribute("isPwd").equals("")){
	    out.print(request.getAttribute("isPwd")+"<br />");}
	if(!request.getAttribute("isPwdSame").equals("")){
	    out.print(request.getAttribute("isPwdSame"));
	}
	%>
	</div>
	<%
	}
	%>


  </div>
<jsp:include page="../site/footer.jsp" />

</body>
</html>