<%@page import="xianzhi.dbHandle.UserHandle"%>
<%@page import="org.w3c.dom.UserDataHandler"%>
<%@page import="xianzhi.dbHandle.GoodsHandle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.text.SimpleDateFormat,java.sql.*,java.util.*,javax.servlet.http.HttpSession,xianzhi.models.*,xianzhi.tools.*"%>
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
    <link href = "src/css/pad.css" rel = "stylesheet">
    <style type="text/css">
     .content_header{

	  border-bottom: 3px solid #669999;
	  width:50%;
	  text-align: center;
	  color:#669999;
	  padding-right:10px;
	  padding-top:10px;
	  padding-bottom: 20px;
	  margin:0 auto 15px;
	}
    </style>
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


  <div class = "container">
 
  <div class = "pad_side_left">

    <div class = "pad_pad">
      <div class = "pad_header">
      分类
      </div>
      <%
      	GoodsHandle Goods= new GoodsHandle();
        int[] sum = Goods.findAllSum();
        int allsum = 0;
        for(int i = 0 ; i < sum.length ; i ++ ) allsum +=sum[i];
        System.out.println("sumlength========="+sum.length);
      %>
      <a href="index.jsp?ceta=6" id = "pad_item" >全部<span><%=allsum %></span></a>
      <div class = "side-seperator"></div>     

      <a href="index.jsp?ceta=1" id = "pad_item" >书籍<span><%=sum[1] %></span></a>
      <div class = "side-seperator"></div>

      <a href="index.jsp?ceta=2" id = "pad_item" >生活出行<span><%=sum[2] %></span></a>
      <div class = "side-seperator"></div>

      <a href="index.jsp?ceta=3" id = "pad_item" >体育运动<span><%=sum[3] %></span></a>
      <div class = "side-seperator"></div>

      <a href="index.jsp?ceta=4" id = "pad_item" >衣物鞋包<span><%=sum[4] %></span></a>
      <div class = "side-seperator"></div>

      <a href="index.jsp?ceta=5" id = "pad_item" >电子产品<span><%=sum[5] %></span></a>
      <div class = "side-seperator"></div>
      
      <a href="index.jsp?ceta=0" id = "pad_item" >其他<span><%=sum[0] %></span></a>
      <div class = "side-seperator"></div>
    </div>

    <div class = "pad_pad">
     <div class = "pad_header">
     最近发布
     </div>
     <%
     	
        List <Goods> first3 = Goods.findFirst3();
        for (Goods firstgood:first3){
     %>
     <a href="goods/info.jsp?goodsid=<%=firstgood.getId()%>" id = "pad_item" >
     						<%java.util.Date date=firstgood.getCreatDate();
			            	  SimpleDateFormat myFmt=new SimpleDateFormat("yyyy年MM月dd日 HH时mm分");
			  				  String dateStr =myFmt.format(date);
  						      out.print(dateStr); %>
  						      <p><%=firstgood.getName() %></p></a>
     <div class = "side-seperator"></div>
     <%} %>

   </div>


  </div>


<%
 if(isLogined!=null && isLogined == true){%>
	 <div class = "pad_side_right">

	    <div class = "pad_pad">
	    
	      <div class = "pad_header">
	      
	    	  <%= username %>
	    
	      </div>
	      <% 
	      System.out.println("gggg");
	         String temppath = "user/personal.jsp?user=";
	      	 if(isLogined==null || isLogined==false) temppath += "0";
	      	 else temppath += user.getId();
	      	 System.out.println(temppath);
	      %>
	      
		   <a href ="<%=temppath %>&tab=info" id = "pad_item" >个人中心</a>
		   <div class = "side-seperator"></div>
		
		   <a href ="<%=temppath %>&tab=push" id = "pad_item" >发布物品</a>
		   <div class = "side-seperator"></div>
		
		   <%-- <a href ="<%=temppath %>&tab=setting" id = "pad_item" >设置</a>
		   <div class = "side-seperator"></div>
		
		   <a href ="<%=temppath %>&tab=mess" id = "pad_item" >消息<span>2</span></a>
		   <div class = "side-seperator"></div>
 --%>
	    </div>
	  </div>
<% 
 }
%>
 
			
			

	<div class = "content">
	
			<% 
			
				GoodsHandle goods=new GoodsHandle();
				UserHandle users =new UserHandle();
				System.out.println("初始化数据库 before findAll()");
			     /*  List <Goods> list=goods.findAll(); */
			     List <Goods> list = null;
			     System.out.println("after findAll()");
				 //System.out.println(list.size());
				 %>
				 
				 <div class = "content_header">
				 <% 
				 
				 String ceta=request.getParameter("ceta");
				    if(ceta==null || ceta.equals("6")){
				    	
						out.println("分类-全部");
						list=goods.findAll();
				    }else if(ceta.equals("0")){
				    	
						out.println("分类-其他");
						list=goods.findByCeta(0);
				    }else if(ceta.equals("1")){
				    	out.println("分类-书籍");
				    	list=goods.findByCeta(1);
				    }else if(ceta.equals("2")){
				    	out.println("分类-生活出行");
				    	list=goods.findByCeta(2);
				    }else if(ceta.equals("3")){
				    	out.println("分类-体育运动");
				    	list=goods.findByCeta(3);
				    }else if(ceta.equals("4")){
				    	out.println("分类-衣物鞋包");
				    	list=goods.findByCeta(4);
				    }else if(ceta.equals("5")){
				    	out.println("分类-电子产品");
				    	list=goods.findByCeta(5);
				    }else{
				    	out.println("分类-全部");
						list=goods.findAll();
				    }
				  
				%>
				</div>
				
				
				<%   
			      if(list.size()!=0){
			    	System.out.println("size!=0");
			    	
			    	  for(Goods good:list){
			    	if(good.getProducter_id()==null)continue;
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
			            <a href="goods/info.jsp?goodsid=<%=good.getId()%>"><%=good.getName()%></a>
			          </div>
			          <div class="productor">发布者：<span><a href = "user/someone.jsp?user=1"><%if(USER.getName()!=null){ %><%=USER.getName() %><%}else{%><%=USER.getUsername()%><%}%> </a></span></div>
			          <div class = "product_time">时间：<%
			        		  java.util.Date date=good.getCreatDate();
			            	  SimpleDateFormat myFmt=new SimpleDateFormat("yyyy年MM月dd日 HH时mm分");
			  				  String dateStr =myFmt.format(date);
  						      out.print(dateStr);
 							%></div>
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

