<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link href = "src/css/auditing.css" rel="stylesheet"/>
<div class = "push_pad">
<div class = "form-header">物品审核</div>
  <table >
    <tr>
      <th  style="width:10%;">姓名</th>
      <th style="width:15%;">物品名</th>
      <th  style="width:20%;">详情</th>
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
</div>