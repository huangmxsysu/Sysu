<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="javax.servlet.http.HttpSession,xianzhi.models.*,xianzhi.tools.*"%>
  <div class = "headerbar">
  
  <% 
	
  	 Boolean isLogined=(Boolean)session.getAttribute("isLogined");
     String username=(String)session.getAttribute("UserNameOrName");
     User user=(User)session.getAttribute("loginUser");
     String temppath = "user/personal.jsp?user=";
  	 if(isLogined==null || isLogined==false) temppath += "0";
  	 else temppath += user.getId();
  	 System.out.println("收藏夹path:"+temppath);
     /*System.out.println("heaer.jsp: "+user.getName()); */
  %>
    <div class = "main-icon"><a href = "index.jsp">Sysu闲置</a></div>
    <div class="header-link">
      <a href = "<%=temppath %>&tab=like&page=1" class="link-item">我的收藏</a>
      <a href = "<%=temppath %>&tab=shopcart" class="link-item">购物车(0)</a>
       <%if (isLogined!=null&&isLogined==true){
            %>
            <a href = "/Sysu/outLoginServlet" class = "link-item">退出登陆</a>
            <a href = "<%=temppath %>&tab=info" class="link-item"><%=username%></a>
            <%
       }else{%>
            <a href = "user/login.jsp" class="link-item">登陆</a>
      		<a href = "user/register.jsp" class="link-item">注册</a>
    <% }%>

    </div>
  </div>