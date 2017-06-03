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
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>注册-合肥学院物品交易</title>
<!-- Bootstrap -->
<link href="src/bootstrap3/css/bootstrap.min.css" rel="stylesheet">
<link href="src/index.css" rel="stylesheet">
<link href="src/css/sign.css" rel="stylesheet">

</head>
<body>

  <div class="box">
    <div class="pad">
      <div class="form-header">注册界面</div>
      <form class = "myform" action="#" >
        <label for="username">账号：</label>
        <input type = "text" id = "username" placeholder="995304572@qq.com" required/>
        <div></div>
        <label for="password">密码：</label>
        <input tpye = "text" id = "password" placeholder="密码" required/>
        <div></div>
        <label for="repeat_password">确认：</label>
        <input tpye = "text" id = "repeat_password" placeholder="确认密码" required/>
        <div></div>
        <label for="stu_num">学号：</label>
        <input tpye = "text" id = "stu_num" placeholder="14348040" required/>
        <div></div>
        <label for="name">姓名：</label>
        <input tpye = "text" id = "name" placeholder="黄某某" required/>
        <div></div>
        <input type = "checkbox" id = "agree" />
        <div id = "agreement">我已经阅读了<a id = "agree-link" href = "src/user/agreement.jsp" target = "_blank">《用户协议》</div>
        <button type = "submit">注册</button>
      </form>

    </div>
  </div>

</body>
</html>