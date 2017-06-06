<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href=" <%=basePath%>">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Insert title here</title>
<link href = "src/css/someonepad.css" rel= "stylesheet"/>
<link href = "src/css/detail.css" rel= "stylesheet"/>

<jsp:include page="../site/headinfo.jsp" />
<style>
.content{
margin-left:250px;
}

</style>
</head>

<body>
<jsp:include page="../site/header.jsp"  flush="true" />

   <div class = "box">

    <div class = "pad_side_left">

      <div class = "pad_pad">
        <div class = "pad_header">
          <div class="pad_imgbox">
            <img src="static/user_img/user1.png" alt=""/>
          </div>
          <div class="pad_info">
            <div class="personal_name">姓名：黄木旋</div>
            <div class = "personal_email">邮箱：995304572@qq.com</div>
            <div class = "register_time">注册时间：2017-06-05</div>
          </div>
        </div>

        <a href="index.jsp?ceta=0" id = "pad_item" >全部<span>3</span></a>
        <div class = "side-seperator"></div>
        <a href="index.jsp?ceta=0" id = "pad_item" >书籍<span>1</span></a>
        <div class = "side-seperator"></div>
        <a href="index.jsp?ceta=0" id = "pad_item" >生活出行<span>0</span></a>
        <div class = "side-seperator"></div>
        <a href="index.jsp?ceta=0" id = "pad_item" >衣物鞋包<span>1</span></a>
        <div class = "side-seperator"></div>
        <a href="index.jsp?ceta=0" id = "pad_item" >电子产品<span>0</span></a>
        <div class = "side-seperator"></div>
        <a href="index.jsp?ceta=0" id = "pad_item" >体育运动<span>1</span></a>
        <div class = "side-seperator"></div>

      </div>
    </div>

  <div class = "content">

    <div class="product_box">
        <div class = "img_container">
          <div class="img_box">
            <img src="" alt=""/>
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
            <div class = "productor">时间：2017-06-06 </div>
            <div class="operator">
              <button id = "mybtn" class = "like">收藏</button>
              <button id = "mybtn" class = "to_cart">加入购物车</button>
              <button id = "mybtn" class = "buy">购买</button>
            </div>

          </div>
        </div>
        <div class = "side-seperator"></div>

        <div class="product_box">
            <div class = "img_container">
              <div class="img_box">
                <img src="" alt=""/>
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
                <div class = "productor">时间：2017-06-06 </div>
                <div class="operator">
                  <button id = "mybtn" class = "like">收藏</button>
                  <button id = "mybtn" class = "to_cart">加入购物车</button>
                  <button id = "mybtn" class = "buy">购买</button>
                </div>

              </div>
            </div>
            <div class = "side-seperator"></div>


            <div class="product_box">
                <div class = "img_container">
                  <div class="img_box">
                    <img src="" alt=""/>
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
                    <div class = "productor">时间：2017-06-06 </div>
                    <div class="operator">
                      <button id = "mybtn" class = "like">收藏</button>
                      <button id = "mybtn" class = "to_cart">加入购物车</button>
                      <button id = "mybtn" class = "buy">购买</button>
                    </div>

                  </div>
                </div>
                <div class = "side-seperator"></div>
    </div>

  </div>

  
<jsp:include page="../site/footer.jsp"  flush="true" />
</body>
</html>