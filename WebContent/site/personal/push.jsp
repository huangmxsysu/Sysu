<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isThreadSafe="false"%>
    
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
<label for = "quantity-goods">价格（元）：</label>
<div></div>
<input type = "number" id = "quantity-goods" name = "quantity-goods"/>
<div></div>
<label for = "content-goods">物品简介：</label>
<div></div>
<textarea rows = "3" id = "content-goods" name = "content-goods"></textarea>
<div></div>
<label for = "type_id-goods">选择一个分类：</label>
 <select name = "type_id-goods" >
	 <option value="other">其他</option>
	 <option value="book">书籍</option>
	 <option value="live">生活出行</option>
	 <option value="sport">体育运动</option>
	 <option value="clothes">衣服鞋包</option>
	 <option value="eletronic">电子产品</option>
 </select>
<div></div>

 
<label for = "img-goods">物品图片：</label>
<div></div>
<input type = "file" id = "img-goods" name = "file"/>
<div></div>
<button type = "submit">提交</button>
</form>

<%

 if(request.getParameter("info")!=null && !request.getParameter("info").equals("")){
 
 	if(request.getParameter("success")!=null && request.getParameter("success").equals("1") ){
 %>
 	<div class="myinfo-success">
 	<%
 	request.setCharacterEncoding("utf-8");
 	out.print(request.getParameter("info"));
 	%>
 	</div>
<%}else{%>
    <!-- 数据库异常 -->
 	<div class="myinfo-danger">
 	<%
 	request.setCharacterEncoding("utf-8");
 	out.print(request.getParameter("info"));
 	%>
 	</div>
 	<%} %>
<%} %>


 
<%
 if(request.getParameter("seccess")!=null && request.getParameter("seccess").equals("0") && request.getAttribute("isCheck")!=null){%>
 <div class="myinfo-danger">
 <%
 if(request.getAttribute("nameCheck")!=null&&!request.getAttribute("nameCheck").equals("")){
	 out.print(request.getAttribute("nameCheck"));
	 
 };if(request.getAttribute("quantityCheck")!=null&&!request.getAttribute("quantityCheck").equals("")){
	 out.print(request.getAttribute("quantityCheck"));
	 
 }if(request.getAttribute("contentCheck")!=null&&!request.getAttribute("contentCheck").equals("")){
	 out.print(request.getAttribute("contentCheck"));
	 
 }
 if(request.getAttribute("fileCheck")!=null&&!request.getAttribute("fileCheck").equals("")){
	 out.print(request.getAttribute("fileCheck"));
	 
 }
 %></div>
 <% }%>
</div>


