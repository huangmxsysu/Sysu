<%-- <%@page import="org.apache.el.lang.ELSupport"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,xianzhi.models.*,xianzhi.tools.*,javax.servlet.http.HttpSession"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    System.out.println("base:"+basePath);
%>

<%
 if(request.getParameter("userid")==null && session.getAttribute("isLogin").equals(false)){
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
	<jsp:include page="../site/personal_header.jsp" />
	
  <div class = "box">


  <div class = "personal_side">

    <div class = "personal_pad">
      <div class = "personal_header">

        <div class="personal_imgbox">
          <img src="static/user_img/user1.png" alt=""/>
        </div>



      </div>
          <a href="user/personal.jsp?tab=info" id = "personal_item" ><div id = "item">个人信息</div></a>
	      <div class = "side-seperator"></div>
	      <%if((session.getAttribute("isLogin").equals(true))){%>
				<%if(((User) session.getAttribute("loginUser")).getId()<1000){%>
				<a href="user/personal.jsp?tab=auditing" id = "personal_item" ><div id = "item">物品审核</div></a>
				<div class = "side-seperator"></div>
				<%}%>
 
	
		      <a href="user/personal.jsp?tab=push" id = "personal_item" ><div id = "item">发布商品</div></a>
		      <div class = "side-seperator"></div>
		
		      <a href="user/personal.jsp?tab=history&page=1" id = "personal_item" ><div id = "item">购买历史</div></a>
		      <div class = "side-seperator"></div>
		
		
		      <a href="user/personal.jsp?tab=like&page=1" id = "personal_item" ><div id = "item">收藏夹</div></a>
		      <div class = "side-seperator"></div>
		
		      <a href="user/personal.jsp?tab=setting"  id = "personal_item" ><div id = "item">设置</div></a>
		      <div class = "side-seperator"></div>
	      
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
			<%}%>
		
			
  </div>

  </div>

	<jsp:include page="../site/footer.jsp" />
</body>
</html>