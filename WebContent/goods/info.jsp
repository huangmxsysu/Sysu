<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<link href = "src/css/detail.css" rel="stylesheet"/>

</head>
<body>
	<jsp:include page="../site/personal_header.jsp" />

	  <div class = "content">
    <div class = "content_header">物品详情</div>
    <div class="product_box">
        <div class = "img_container">
          <div class="img_box">
            <img src="static/goods_img/1.jpg" alt=""/>
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
              <a>网球拍</a>
              <span class = "type">书籍</span>
            </div>

            <div class = "product_price"><span>价格：5</span> 数量：2</div>
            <div class = "product_content">这是一个自己用了两个月的球拍，质量挺好的，外观没有磨损，有兴趣的筒子们可以购买</div>
            <div class = "productor"><a href = "#">黄木旋</a> 时间：2017-06-06 </div>
            <div class="operator">
              <button id = "mybtn" class = "like">收藏</button>
              <button id = "mybtn" class = "to_cart">加入购物车</button>
              <button id = "mybtn" class = "buy">购买</button>
            </div>

          </div>
        </div>
        <div class = "side-seperator"></div>
        
      </div>

    <jsp:include page="../site/footer.jsp" />
</body>
</html>