<%@page import="xianzhi.dbHandle.UserHandle"%>
<%@page import="org.w3c.dom.UserDataHandler"%>
<%@page import="xianzhi.dbHandle.GoodsHandle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*,javax.servlet.http.HttpSession,xianzhi.models.*,xianzhi.tools.*"%>
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

			
			
<%-- <jsp:include page="site/main.jsp" /> --%>
<!-- INSERT INTO `goods` VALUES ('1', 'static/goods_img/1.jpg', '4', '笔记本', '1', '4000', '2', '二手笔记本，8成新，I7处理器', 2', '2015-12-12 12:10:10');
INSERT INTO `goods` VALUES ('2', 'static/goods_img/2.jpg', '2', '被套', '1', '30', '2', '二手被套', '2', '2015-12-16 02:34:01');
INSERT INTO `goods` VALUES ('3', 'static/goods_img/3.jpg', '2', '自行车', '1', '50', '2', '二手自行车', '2', '2015-12-11 11:22:33');
INSERT INTO `goods` VALUES ('4', 'static/goods_img/4.jpg', '5', '网球拍', '1', '50', '2', '二手网球拍，用过几天，九成新', '1', '2015-12-17 11:00:16');
INSERT INTO `goods` VALUES ('5', 'static/goods_img/5.jpg', '5', '篮球', '1', '80', '2', '全牛皮篮球，', '1', '2015-12-17 11:02:57'); -->

	<div class = "content">
	
			<% 
			
				GoodsHandle goods=new GoodsHandle();
				UserHandle users =new UserHandle();
				System.out.println("初始化数据库 before findAll()");
			      List <Goods> list=goods.findAll();
			     System.out.println("after findAll()");
				 System.out.println(list.size());
			      if(list.size()!=0){
			    	System.out.println("size!=0");
			    	  for(Goods good:list){
			    	System.out.println("producter_id="+good.getProducter_id());	
			    	System.out.println(" before users.findById()");
			    	User USER = users.findById(good.getProducter_id());
			    	System.out.println("after findById");
			      
			        

			   %>
	
				    <div class="product_box">
			        <div class="img_box">
			          <img src="<%=good.getImage()%>" alt=""/>
			        </div>
			        <div class="content_box">
			          <div class="product_title">
			            <a href="#"><%=good.getName()%></a>
			          </div>
			          <div class="productor">发布者：<span><a href = "#"><%if(USER.getName()!=null){ %><%=USER.getName() %><%}else{%><%=USER.getUsername()%><%}%> </a></span></div>
			          <div class = "product_time">时间：<%=good.getCreatDate()%></div>
			        </div>
			      </div>
			      <div class = "side-seperator"></div>
      		<%	  
			    	  }
			    	  
			      }
			%>

      

<!-- 		      <div class="product_box">
		        <div class="img_box">
		          <img src="static/user_img/user1.png" alt=""/>
		        </div>
		        <div class="content_box">
		          <div class="product_title">
		            <a href="#">甩卖自用固态硬盘(电子产品)</a>
		          </div>
		          <div class="productor">发布者：<span><a href = "#">黄木旋</a></span></div>
		          <div class = "product_time">时间：2015-08-23 00:04:23</div>
		        </div>
		      </div>
		
			<div class = "side-seperator"></div> -->
	</div>
  </div>


<%--引入脚部 --%>
<jsp:include page="site/footer.jsp" />


</body>

</html>

