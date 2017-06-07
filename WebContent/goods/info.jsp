<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="xianzhi.dbHandle.UserHandle,xianzhi.dbHandle.GoodsHandle,xianzhi.models.*,java.util.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<head>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    System.out.println("base:"+basePath);
%>
<base href="<%=basePath%>">
<jsp:include page="../site/headinfo.jsp" />
<title>物品详情页</title>
<script type="text/javascript">
function shoppingCart(loginUserId,goodsNum,goodsId){
	if(loginUserId!=-1){
		
	xmlShop=new XMLHttpRequest();
	xmlShop.onreadystatechange=function()
	  {
	  if ((xmlShop.readyState==4)&&(xmlShop.status==200))
	    {alert("4");
	    if(xmlShop.responseText=="success")
	    	{
	    	alert("5");
	    	
	    	document.getElementById("goodsNum").innerHTML=(parseInt(document.getElementById("goodsNum").innerHTML)+1).toString();
	    		
	    	}
	    }
	  else{
		  //document.getElementById("auditing-button-"+goodsid).innerHTML="=操作中=";
	  }
	  }
	xmlShop.open("GET","ShoppingCartServlet?goodsId="+goodsId+"&t="+Math.random()+"&userId="+loginUserId,true);
	xmlShop.send();
	}
	else{
		
		alert("请登录");
		
	}
	
	
	
	
	
	
}
</script>
<link href = "src/css/detail.css" rel="stylesheet"/>

</head>
<body>
	<jsp:include page="../site/personal_header.jsp" />

<%
int goodsId=Integer.parseInt(request.getParameter("goodsid"));
Integer loginUserId=(((User)session.getAttribute("loginUser")).getId());
Integer goodsNum=0;
if(loginUserId!=null){
	 goodsNum=(Integer)session.getAttribute("goodsNum");
	
}else{
	loginUserId=-1;
	
}
	GoodsHandle goodsHandle=new GoodsHandle();
	UserHandle userHandle=new UserHandle();
	Goods good=goodsHandle.findById(goodsId);
	pageContext.setAttribute("good",good);
	User Procuteuser=userHandle.findById(good.getProducter_id());
	 pageContext.setAttribute("Procuteuser",Procuteuser);
	 int typeId= good.getType_id();
	 String typeName="";
	 switch(typeId){
	 case 0:typeName="其他";
	 break;
	 case 1:typeName="书籍";
	 break;
	 case 2:typeName="生活用品";
	 break;
	 case 3:typeName="体育";
	 break;
	 case 4:typeName="衣装";
	 break;
	 case 6:typeName="电子";
	 break;
	}
	Date date=good.getCreatDate();
	
	SimpleDateFormat myFmt=new SimpleDateFormat("yyyy年MM月dd日 HH时mm分");
	String dateStr =myFmt.format(date);
%>


	  <div class = "content">
    <div class = "content_header">物品详情</div>
    <div class="product_box">
        <div class = "img_container">
          <div class="img_box">
            <img src="<%=good.getImage() %>" alt=""/>
          </div>

          <div class="img_box">
            <img src="" alt=""/>
          </div>

          <div class="img_box">
            <img src="" alt=""/>
          </div>
        </div>
          <div class="content_box">
            <div class="product_title">
              <a>${good.getName()}</a>
              <span class = "type"><%=typeName %></span>
              <!-- 修复标记添加链接 -->
            </div>

            <div class = "product_price"><span>价格：5</span> 数量：2</div>
            <div class = "product_content">${good.getContent()}</div>
            <div class = "productor"><a href = "user/someone.jsp">${Procuteuser.getName()}(联系邮箱: ${Procuteuser.getUsername()})</a> 时间：<%=dateStr%> </div>
            <div class="operator">
              <button id = "mybtn" class = "like">收藏</button>
              <button id = "mybtn" class = "to_cart" onclick="shoppingCart(<%=loginUserId%>,<%=goodsNum %>,<%=good.getId()%>)">加入购物车</button>
              <button id = "mybtn" class = "buy">购买</button>
            </div>

          </div>
        </div>
        <div class = "side-seperator"></div>
        
      </div>

    <jsp:include page="../site/footer.jsp" />
</body>
</html>