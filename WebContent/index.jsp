<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
  	<base href=" <%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>中山大学-物品交易-首页</title>
    <link href="src/index.css" rel="stylesheet">
  </head>
  <body>
  <div class = "headerbar">
    <div class = "main-icon"><a href = "#">Sysu闲置</a></div>
    <div class = "search-box">
        <input type="text" id = "search-text" name = "search-text" placeholder = "关键字">
        <input type = "button" class="search-icon" value = "搜索"/>
    </div>
    <div class="header-link">
      <a href = "#" class="link-item">我的收藏</a>
      <a href = "#" class="link-item">购物车(0)</a>
      <a href = "#" class="link-item">登陆</a>
      <a href = "#" class="link-item">注册</a>
    </div>
  </div>


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
    </div>



    <div class = "pad">
      <div class = "side-header">最近发布</div>
      <div class = "side-item"><a href = "#" id = "item-name" >用户1：物品a</a><span>1</span></div>
      <div class = "side-seperator"></div>

      <div class = "side-item"><a href = "#" id = "item-name" >用户2：物品b</a><span>13</span></div>
      <div class = "side-seperator"></div>

      <div class = "side-item"><a href = "#" id = "item-name" >用户3：物品c</a><span>5</span></div>
      <div class = "side-seperator"></div>
    </div>
  </div>


  <div class = "right-side">

    <div class = "pad">
      <div class = "side-header">个人中心</div>
      <div class = "side-item"><a href = "#" id = "item-name" >我的历史</a></div>
      <div class = "side-seperator"></div>

      <div class = "side-item"><a href = "#" id = "item-name" >个人资料</a></div>
      <div class = "side-seperator"></div>

      <div class = "side-item"><a href = "#" id = "item-name" >设置</a></div>
      <div class = "side-seperator"></div>

      <div class = "side-item"><a href = "#" id = "item-name" >我的消息</a><span>5</span></div>
      <div class = "side-seperator"></div>

      <div class = "side-item"><a href = "#" id = "item-name" >退出登录</a></div>
      <div class = "side-seperator"></div>
    </div>
  </div>


    <div class = "content">右侧主体
    <%
			// 驱动程序名
String driver = "com.mysql.jdbc.Driver";
// URL指向要访问的数据库名scutcs
String url = "jdbc:mysql://127.0.0.1:3306/runoob";
// MySQL配置时的用户名
String user = "root";
// MySQL配置时的密码
String password = "huangmxsysu";
try
{
    // 加载驱动程序
    Class.forName(driver).newInstance();
    // 连续数据库
    Connection conn = DriverManager.getConnection(url, user, password);
    if(!conn.isClosed())
        out.println("Succeeded connecting to the Database!");
    // statement用来执行SQL语句
    Statement statement = conn.createStatement();
    ResultSet rs = statement.executeQuery("select * from websites");
    out.println("<br/>");
    while(rs.next())
    {
        out.println(rs.getString("name"));
        out.println(rs.getString("url"));
        out.println("<br/>");
    }
    
}
catch(ClassNotFoundException e)
{
    System.out.println("Sorry,can`t find the Driver!");
    e.printStackTrace();
}
%>
    
    
    </div>
  </div>



  <div class = "footerbar">-----Power By mosen----</div>


</body>

</html>

