<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="javax.servlet.http.HttpSession,xianzhi.models.*,xianzhi.tools.*"%>
  <div class = "headerbar">
  
  <% 
  	 Boolean isLogin=(Boolean)session.getAttribute("isLogin");
     String username=(String)session.getAttribute("username");
  %>
    <div class = "main-icon"><a href = "#">Sysu闲置</a></div>
    <div class = "search-box">
        <input type="text" id = "search-text" name = "search-text" placeholder = "关键字">
        <button class="search-icon">搜索</button>
    </div>
    <div class="header-link">
      <a href = "#" class="link-item">我的收藏</a>
      <a href = "#" class="link-item">购物车(0)</a>
       <%if (isLogin!=null&&isLogin==true){
            %>
            <a href = "/Sysu/outLoginServlet" class = "link-item">退出登陆</a>
            <a href = "#" class="link-item"><%=username%></a>
            <%
       }else{%>
            <a href = "user/login.jsp" class="link-item">登陆</a>
      		<a href = "user/register.jsp" class="link-item">注册</a>
    <% }%>

    </div>
  </div>