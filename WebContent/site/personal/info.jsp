<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.text.SimpleDateFormat,java.sql.*,xianzhi.dbHandle.*,xianzhi.tools.*,javax.servlet.http.HttpSession,java.util.*,xianzhi.models.*"%>
<%
UserHandle userHandle =new UserHandle();
String userid=request.getParameter("user");
User user=null;
if(userid!=null){
    user=userHandle.findById(Integer.parseInt(userid));
}
else{
    //
}
//修复标记，是否可以修改 

%>

    <div class = "personal_pad">
      <div class = "personal_header" style="height:400px">

        <div class="personal_imgbox" style="margin-top:-100px">
          <img src="static/user_img/user1.png" alt=""/>
        </div>
        <div class = "personal_info" style="top:200px">
          <div class="personal_name">姓名：<%= user.getName()%></div>
          <div class = "personal_email">邮箱：995304572@qq.com</div><!-- 修复标记，user表增加注册邮箱字段 -->
          <div class="personal_name">学号：<%=user.getStu_num() %></div>
          <div class="personal_name">用户名：<%=user.getUsername() %></div>
          <div class = "register_time">注册时间：2015-08-23</div>  <!-- 修复标记，user表增加注册时间字段 -->
        </div>
       </div>
     </div>
        
