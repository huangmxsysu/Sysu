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

<title>登陆--中大闲置</title>

<link href="src/css/sign.css" rel="stylesheet">

</head>
<body>
<jsp:include page="../site/header.jsp"  flush="true" />
 


  <div class="box">

    <div class="pad">
      <div class="form-header">登陆界面</div>
      <form class = "myform" action="/Sysu/LoginServlet" Method="POST" >
        <label for="username">账号：</label>
        <input type = "text" id = "username" name = "username" placeholder="邮箱地址" required/>
        <div></div>
        <label for="password">密码：</label>
        <input tpye = "text" id = "password" name = "password" placeholder="密码" required/>
        <input type="checkbox" id = "remember_me" name="remember_me"> 下次自动登录
        <button type = "submit">登陆</button>
      </form>

    </div>
    
       <%if(request.getAttribute("isRegister")!=null){%>
   			<div class = "myinfo-success">
		<%
		    out.print("注册成功！您可以登陆了");
		
		%>
		</div>
		<% 
		} 
		%>
   <%if(request.getAttribute("isLogin")!=null&& request.getAttribute("isLogin").equals("false")){%>
   			<div class = "myinfo-danger">
		<%if(!request.getAttribute("samePwd").equals("")){
		    out.print(request.getAttribute("samePwd")+"<br />");}
		if(!request.getAttribute("hasUsername").equals("")){
		    out.print(request.getAttribute("hasUsername"));}
		%>
		</div>
	<% 
	} 
	%>
  </div>
<jsp:include page="../site/footer.jsp" />
</body>
</html>