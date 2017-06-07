<%@page import="xianzhi.dbHandle.UserHandle"%>
<%@page import="org.w3c.dom.UserDataHandler"%>
<%@page import="xianzhi.dbHandle.GoodsHandle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.text.SimpleDateFormat,java.sql.*,java.util.*,javax.servlet.http.HttpSession,xianzhi.models.*,xianzhi.tools.*"%>
<%
   String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href=" <%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sysu闲置--已发布</title>
<link href = "src/css/push.css" rel="stylesheet"/>
<link href = "src/css/main_like.css" rel= "stylesheet"/>

</head>
<body>

<%

GoodsHandle goods=new GoodsHandle();
UserHandle users =new UserHandle();
System.out.println(" pushed.jsp : 初始化数据库 before find");
 /*  List <Goods> list=goods.findAll(); */
 List <Goods> listPublished = null;
 List <Goods> listNotAuditing = null;
 List <Goods> listRejected = null;
 int userid = Integer.parseInt(request.getParameter("user"));
 listPublished=goods.findAllPublishedByUser(userid);
 listNotAuditing=goods.findAllNotAuditingByUser(userid);
 listRejected=goods.findAllRejectedByUser(userid);
 System.out.println("after find");
 System.out.println("published size=" + listPublished.size() + " NotAuditing size = " + listNotAuditing.size() + " Rejected size = " + listRejected.size());
 String[] TYPE = {"其他","书籍","生活出行","体育运动","衣物鞋包","电子产品"};
%>
  <div class = "push_pad" >
  
    <div class = "form-header">已发布(<%=listPublished.size() %>)</div>
    <%
    	for(Goods good:listPublished){%>

    <div class = "product_box">
    	<div class = "img_box">
    		<img src = "<%=good.getImage() %>" alt=""/>
    	</div>
    	<div class = "content_box">
    		<div class = "product_title">
    			<a href = "goods/info.jsp?goodsid=<%=good.getId()%>"><%=good.getName() %>(<%=TYPE[good.getType_id()] %>)</a>
    		</div>
    		<div class = "product_time">时间：<%=good.getCreatDate() %></div>
    	</div>
    </div>
    <div class = "side-seperator"></div>
    <% 	
    	}
    %>
    
       <div class = "form-header">待审核(<%=listNotAuditing.size() %>)</div>
    <%
    	for(Goods good:listNotAuditing){%>

    <div class = "product_box">
    	<div class = "img_box">
    		<img src = "<%=good.getImage() %>" alt=""/>
    	</div>
    	<div class = "content_box">
    		<div class = "product_title">
    			<a href = "goods/info.jsp?goodsid=<%=good.getId()%>"><%=good.getName() %>(<%=TYPE[good.getType_id()] %>)</a>
    		</div>
    		<div class = "product_time">时间：<%=good.getCreatDate() %></div>
    	</div>
    </div>
    <div class = "side-seperator"></div>
    <% 	
    	}
    %>
    
       <div class = "form-header">已拒绝(<%=listRejected.size() %>)</div>
    <%
    	for(Goods good:listRejected){%>

    <div class = "product_box">
    	<div class = "img_box">
    		<img src = "<%=good.getImage() %>" alt=""/>
    	</div>
    	<div class = "content_box">
    		<div class = "product_title">
    			<a href = "goods/info.jsp?goodsid=<%=good.getId()%>"><%=good.getName() %>(<%=TYPE[good.getType_id()] %>)</a>
    		</div>
    		<div class = "product_time">时间：<%=good.getCreatDate() %></div>
    	</div>
    </div>
    <div class = "side-seperator"></div>
    
    <%}%>

 <!--  	<div class = "form-header">已发布</div>
  	
  	
      <div class="product_box">
        <div class="img_box">
          <img src="static/user_img/user6.png" alt=""/>
        </div>
        <div class="content_box">
          <div class="product_title">
            <a href="#">甩卖自用固态硬盘(电子产品)</a>
          </div>
          
          <div class = "product_time">时间：2015-08-23 00:04:23</div>
        </div>
      </div>

	<div class = "side-seperator"></div>
	
	      <div class="product_box">
        <div class="img_box">
          <img src="static/user_img/user6.png" alt=""/>
        </div>
        <div class="content_box">
          <div class="product_title">
            <a href="#">甩卖自用固态硬盘(电子产品)</a>
          </div>
          
          <div class = "product_time">时间：2015-08-23 00:04:23</div>
        </div>
      </div>

	<div class = "side-seperator"></div> 
	
	<div class = "form-header">待审核</div>
	      <div class="product_box">
        <div class="img_box">
          <img src="static/user_img/user6.png" alt=""/>
        </div>
        <div class="content_box">
          <div class="product_title">
            <a href="#">甩卖自用固态硬盘(电子产品)</a>
          </div>
          
          <div class = "product_time">时间：2015-08-23 00:04:23</div>
        </div>
      </div>

	<div class = "side-seperator"></div> -->
	
  </div>
</body>
</html>