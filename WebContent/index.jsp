<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="javax.servlet.http.HttpSession,xianzhi.models.*,xianzhi.tools.*"%>
<%@ page import="java.sql.*"%>
<%
   String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
  	<base href=" <%=basePath%>">
  	
  	<%--页面头部信息及jquery引入 --%>
  	
  	
  	<jsp:include page="site/headinfo.jsp" />
  	
    <title>中山大学-物品交易-首页</title>
    
    <link href="src/css/main.css" rel="stylesheet">
  </head>
  
  
  <body>
  
 <%
 Boolean isLogined=(Boolean)session.getAttribute("isLogined");
 String username=(String)session.getAttribute("UserNameOrName");
 User user=(User)session.getAttribute("loginUser"); 

 if(isLogined==null){
	 System.out.println("初始isLogined为空");
 }
 else{
	 System.out.println(isLogined);
 }
 if(username==null){
	 System.out.println("初始username为空");
 }
 else{
	 System.out.println(username);
 }
 System.out.println("bug");
 /* System.out.println("getUser"+user.getId()); */
 
 %>
    <%--引入导航部分 --%>
	<jsp:include page="site/header.jsp" />


  <div class = "box">
    <div class = "left-side">

    <div class = "pad">
      <div class = "side-header">分类</div>

      <div class = "side-item"><a href = "#" id = "item-name">电子产品</a><span>2</span></div>
      <div class = "side-seperator"></div>

      <div class = "side-item"><a href = "#" id = "item-name" >书籍</a><span>13</span></div>
      <div class = "side-seperator"></div>

      <div class = "side-item"><a href = "#" id = "item-name" >体育运动</a><span>5</span></div>
      <div class = "side-seperator"></div>

      <div class = "side-item"><a href = "#" id = "item-name" >衣物鞋包</a><span>8</span></div>
      <div class = "side-seperator"></div>
      
      <div class = "side-item"><a href = "#" id = "item-name" >生活出行</a><span>6</span></div>
      <div class = "side-seperator"></div>
      
      <div class = "side-item"><a href = "#" id = "item-name" >其他</a><span>11</span></div>
      <div class = "side-seperator"></div>
    </div>



    <div class = "pad">
      <div class = "side-header">最近发布</div>
      <div class = "side-item"><a href = "#" id = "item-name" >用户1：物品a</a><span>1</span></div>
      <div class = "side-seperator"></div>

      <div class = "side-item"><a href = "#" id = "item-name" >用户2：物品b</a><span>13</span></div>
      <div class = "side-seperator"></div>

      <div class = "side-item"><a href = "#" id = "item-name" >用户3：物品c</a><span>5</span></div>
      <div class = "side-seperator"></div>
      
      <div class = "side-item"><a href = "#" id = "item-name" >用户3：物品c</a><span>5</span></div>
      <div class = "side-seperator"></div>
    </div>
  </div>


  <div class = "right-side">

    <div class = "pad">
    
      <div class = "side-header">
      <%
      System.out.println("hhhhh");
      if (isLogined!=null&&isLogined==true){%>
    	  <%= username %>
    <%}else{ %>
    	  个人
      <%} %>
      </div>
      <% 
      System.out.println("gggg");
         String temppath = "user/personal.jsp?user=";
      	 if(isLogined==null || isLogined==false) temppath += "0";
      	 else temppath += user.getId();
      	 System.out.println(temppath);
      %>
      
      <div class = "side-item"><a href ="<%=temppath %>&tab=info" id = "item-name" >个人中心</a></div>
      <div class = "side-seperator"></div>
      
      <div class = "side-item"><a href ="<%=temppath %>&tab=push" id = "item-name" >发布商品</a></div>
      <div class = "side-seperator"></div>

      <div class = "side-item"><a href ="<%=temppath %>&tab=setting" id = "item-name" >设置</a></div>
      <div class = "side-seperator"></div>

      <div class = "side-item"><a href ="<%=temppath %>&tab=mess" id = "item-name" >我的消息</a><span>5</span></div>
      <div class = "side-seperator"></div>

    </div>
  </div>

<jsp:include page="site/main.jsp" />

  </div>


<%--引入脚部 --%>
<jsp:include page="site/footer.jsp" />


</body>

</html>

