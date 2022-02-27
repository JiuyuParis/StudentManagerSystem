<%@page import="db.bean.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	UserInfo userInfo=(UserInfo)session.getAttribute("userInfo");//从session中取得用户信息
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>学生管理系统</title>
  <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body class="layui-layout-body">
	
<div class="layui-layout layui-layout-admin">
	<!-- 头部导航开始 -->
  <div class="layui-header">
    <div class="layui-logo">学生管理系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-right">
    	<li class="layui-nav-item"><%=userInfo.getName() %></li>
      <li class="layui-nav-item"><a href="login.jsp">注销</a></li>
    </ul>
  </div>
  <!-- 头部导航结束 -->
  
  <!-- 左侧导航开始 -->
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item"><a href="profession.jsp" target="rightFrame">专业管理</a></li>
        <li class="layui-nav-item"><a href="grade.jsp" target="rightFrame">年级管理</a></li>
        <li class="layui-nav-item"><a href="classt.jsp" target="rightFrame">班级管理</a></li>
        <li class="layui-nav-item"><a href="notice.html" target="rightFrame">学生管理</a></li>
        <li class="layui-nav-item"><a href="notice.html"  target="rightFrame">成绩管理</a></li>
      </ul>
    </div>
  </div>
  <!-- 左侧导航结束 -->
  
  <!-- 右侧主体开始 -->
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <iframe name="rightFrame" src="" width="100%" height="100%"></iframe>
  </div>
  <!-- 右侧主体结束 -->
  
  <!-- 底部开始 -->
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © lntu.edu.cn - 辽宁工程技术大学
  </div>
</div>
<!-- 底部结束 -->

<script src="layui/layui.js"></script>
<script>
//JavaScript代码区域
layui.use(['element','layer'], function(){
  var element = layui.element;
  var layer=layui.layer;
  layer.msg("欢迎登陆！");
});
</script>
</body>
</html>
