<%-- <%@page import="org.apache.el.lang.ELSupport"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,xianzhi.dbHandle.*,xianzhi.models.*,xianzhi.tools.*,javax.servlet.http.HttpSession"%>
<%
    request.setCharacterEncoding("utf8");
    response.setCharacterEncoding("utf8");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    System.out.println("base:"+basePath);
%>

<%
 
 if((session.getAttribute("isLogined") == null) || ((Boolean)session.getAttribute("isLogined") == false) ) System.out.println("personal:   isLogined==false");
 else System.out.println("personal:   isLogined==true");
 if(session.getAttribute("isLogined") == null || ((Boolean)session.getAttribute("isLogined") == false) ){
	 System.out.println("redirect!!!");
	 response.sendRedirect("login.jsp?login-info="+java.net.URLEncoder.encode("请先登录网站","UTF-8"));
 }
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户中心 - 中大闲置</title>
</head>
<body>
<head>

<base href="<%=basePath%>">
<jsp:include page="../site/headinfo.jsp" />
<title>用户中心</title>

<link href="src/css/personal.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../site/header.jsp" />
	
  <div class = "box">

      	  <%
      	  int userId = 0;
      	  String myimg = "";
      	  UserHandle USER = new UserHandle();
      	  userId = Integer.parseInt(request.getParameter("user"));
      	  User user = USER.findById(userId);
      	  if(user!=null)
      	  System.out.println("myimg="+user.getImg()); 
          %> 
  <div class = "personal_side">

    <div class = "personal_pad">
      <div class = "personal_header">

        <div class="personal_imgbox">
          <img src="<%=user.getImg()%>" alt=""/>
        </div>



      </div>
      	  <!-- 此时进入personal界面时候LoginUser一定存在 -->

      	  
      	  
      	  
              <a href="user/personal.jsp?user=<%=userId %>&tab=info" id = "personal_item" ><div id = "item">个人信息</div></a>
	          <div class = "side-seperator"></div>
	          
	          <a href="user/personal.jsp?user=<%=userId %>&tab=modify" id = "personal_item" ><div id = "item">修改头像</div></a>
		      <div class = "side-seperator"></div>
	
		      <a href="user/personal.jsp?user=<%=userId %>&tab=push" id = "personal_item" ><div id = "item">发布商品</div></a>
		      <div class = "side-seperator"></div>
		      
		      <a href="user/personal.jsp?user=<%=userId %>&tab=pushed"  id = "personal_item" ><div id = "item">已发布</div></a>
		      <div class = "side-seperator"></div>
		
		      <a href="user/personal.jsp?user=<%=userId %>&tab=history&page=1" id = "personal_item" ><div id = "item">购买历史</div></a>
		      <div class = "side-seperator"></div>
		
			  <a href="user/personal.jsp?user=<%=userId %>&tab=shopcart"  id = "personal_item" ><div id = "item">购物车</div></a>
		      <div class = "side-seperator"></div>
		
		      <a href="user/personal.jsp?user=<%=userId %>&tab=like&page=1" id = "personal_item" ><div id = "item">收藏夹</div></a>
		      <div class = "side-seperator"></div>
		
		      <%-- <a href="user/personal.jsp?user=<%=userId %>&tab=mess"  id = "personal_item" ><div id = "item">消息</div></a>
		      <div class = "side-seperator"></div>
		      
		      <a href="user/personal.jsp?user=<%=userId %>&tab=setting"  id = "personal_item" ><div id = "item">设置</div></a>
		      <div class = "side-seperator"></div> --%>
		      
		      
		      
		      <%if((session.getAttribute("isLogined") !=null) && ( (Boolean) session.getAttribute("isLogined")).equals(true)){%>
			  <%if( ((User) session.getAttribute("loginUser")) != null && ((User) session.getAttribute("loginUser")).getId()<3){%>
				<a href="user/personal.jsp?user=<%=userId %>&tab=auditing" id = "personal_item" ><div id = "item">物品审核</div></a>
				<div class = "side-seperator"></div>
			  <%}%>
	      
	      <%}%>
    </div>
  </div>
  
  <div class = "personal_content">
  			
			<%if(request.getParameter("tab").equals("push")){%>
				<jsp:include page="../site/personal/push.jsp" />
			<%} else if(request.getParameter("tab").equals("info")){%>
			<jsp:include page="../site/personal/info.jsp" />
			<%}else if(request.getParameter("tab").equals("auditing")){%>
			<jsp:include page="../site/personal/auditing.jsp" />
			<%}else if(request.getParameter("tab").equals("like")){%>
			<jsp:include page="../site/personal/like.jsp" />
			<%}else if(request.getParameter("tab").equals("history")){%>
			<jsp:include page="../site/personal/history.jsp" />
			<%-- <%}else if(request.getParameter("tab").equals("mess")){%>
			<jsp:include page="../site/personal/mess.jsp" /> --%>
			<%}else if(request.getParameter("tab").equals("pushed")){%>
			<jsp:include page="../site/personal/pushed.jsp" />
			<%}else if(request.getParameter("tab").equals("shopcart")){%>
			<jsp:include page="../site/personal/shopcart.jsp" />
			<%}else if(request.getParameter("tab").equals("modify")){%>
			<jsp:include page="../site/personal/modifyinfo.jsp" />
			<%}%>
			
		
			
  </div>

  </div>

	<jsp:include page="../site/footer.jsp" />
</body>
</html>