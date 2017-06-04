<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   String path = request.getContextPath();
   String servletPath=path+"/GoodsCheckServlet";
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
   System.out.println("servletpath=" + servletPath + "  basePath = " + basePath);
 %>
<link href = "src/css/push.css" rel="stylesheet"/>

<div class = "push_pad">
<div class = "form-header">发布新物品</div>
<form class = "myform" action = <%=servletPath%>  method="post" enctype="multipart/form-data">

<label for = "name-goods">物品名称：</label>
<div></div>
<input id = "name-goods" name = "name-goods"/>
<div></div>
<label for = "quantity-goods">数量：</label>
<div></div>
<input type = "number" id = "quantity-goods" name = "quantity-goods"/>
<div></div>
<label for = "content-goods">物品简介：</label>
<div></div>
<textarea rows = "5" id = "content-goods" name = "content-goods"></textarea>
<div></div>
<label for = "img-goods">物品图片：</label>
<div></div>
<input type = "file" id = "img-goods" name = "img-goods"/>
<div></div>
<button type = "submit">提交</button>
</form>
</div>


