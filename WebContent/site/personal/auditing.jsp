<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="xianzhi.dbHandle.*,xianzhi.models.*,java.sql.*,java.util.*,java.text.SimpleDateFormat" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<link href = "src/css/auditing.css" rel="stylesheet"/>

<script>
function passGoods(goodsid,type){
	xmlGoods=new XMLHttpRequest();
	xmlGoods.onreadystatechange=function()
	  {
	  if (xmlGoods.readyState==4 && xmlGoods.status==200)
	    {
	    if(xmlGoods.responseText=="success")
	    	{
	    		if(type=="pass"){
	    			document.getElementById("auditing-button-"+goodsid).innerHTML="<p class=\"bg-info\">已通过</p>";
	    			
	    		}
	    		if(type=="refuse"){document.getElementById("auditing-button-"+goodsid).innerHTML="<p class=\"flag-danger\">已拒绝</p>";}
	    	}
	    }
	  else{
		  //document.getElementById("auditing-button-"+goodsid).innerHTML="=操作中=";
	     }
	  }
	xmlGoods.open("GET","AuditingServlet?goodsid="+goodsid+"&t="+Math.random()+(type=="pass"?"&hd=1":"&hd=0"),true);
	xmlGoods.send(null);
}
</script>




<table>
    <tr>
      <th   style="width:10%;">用户</th>
      <th  style="width:15%;">发布于</th>
      <th style="width:15%;">物品名</th>
      <th  style="width:25%;">详情</th>
      <th  style="width:15%;">操作</th>
    </tr>
	<%
	GoodsHandle goodsHandle=new GoodsHandle();
	UserHandle userHandle=new UserHandle();
	try{
	List<Goods> all = goodsHandle.findAllNotAuditing();
	if(all==null){
		System.out.print("cant find anything");
	}else{
	
		for(Goods goods:all)
		{
		%>
	
	<tr>
	  <td style="width:10%;">
		<%
				if(userHandle.findById(goods.getProducter_id()).getName()==null){
			    out.print(userHandle.findById(goods.getProducter_id()).getUsername());
				}
 			else{
 				    out.print(userHandle.findById(goods.getProducter_id()).getName());
 				}
 				%>
	  </td>
	  
	  <td style="width:15%;">
		<%=new SimpleDateFormat("yyyy/MM/dd HH:mm").format(goods.getCreatDate())%>
	  </td>
	  
	  
	  <td style="width:15%;">
		<%=goods.getName()%>
	  </td>
	  
	  <td style="width:15%;">
		<abbr title="<%=goods.getContent()%>">[详情]</abbr>
	  </td>
  
	  	
	  <td>
		<div id="auditing-button-<%=goods.getId()%>">
	  	<button type="button" class="mybtn-success" onclick="passGoods(<%=goods.getId()%>,'pass');">通过</button>
	  	<button type="button" class="mybtn-danger" onclick="passGoods(<%=goods.getId()%>,'refuse');">拒绝</button>
		</div>
	  	</td>
	  </tr>
	
		<%}%>
	<%}}catch(Exception e){
    out.print("数据库异常");
 }%>

</table>




<!-- 
<div class = "push_pad">
<div class = "form-header">物品审核</div>
  <table >
    <tr>
      <th  style="width:10%;">姓名</th>
      <th  style="width:15%;">发布于</th>
      <th style="width:15%;">物品名</th>
      <th  style="width:25%;">详情</th>
      <th  style="width:15%;">操作</th>
    </tr>

    <tr>
    	<td >黄木旋</td>
    	<td >固态硬盘</td>
    	<td>
        <abbr title="hahahhahhah" class="initialism">HTML</abbr>
    	</td>
    	<td>
        <div>
          <button type="button" class="mybtn-success">通过</button>
          <button type="button" class="mybtn-danger">拒绝</button>
        </div>
    	</td>
    </tr>
  </table>
</div> -->