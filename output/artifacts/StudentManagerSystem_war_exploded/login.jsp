<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>登录</title>
		<link rel="styesheet" type='text/css' href="layui/css/layui.css">
		<script src="js/jquery-3.5.1.min.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			body{
				background-image: url("img/寂静站台%20星空%20夜晚%20电线杆%20单车%20唯美意境.jpg");
				background-repeat: no-repeat;
			}
			.box{
				width: 300px;
				height: 200px;
				/* 将元素水平居中 距离顶部位移200px auto居中 */
				margin: 200px auto;
	/* 			background-color: blue; */
				border: 3px solid black;
				/* 边框圆角修饰 */
				border-radius: 10px;
			}
			.inpBox{
				width: 85%;
				margin: 10px auto;
			}
			.loginInput{
				width: 80px;
				height: 30px;
				background-color: lightgreen;
				border-radius: 5px;
				margin: 5px auto;
				/* 转换成块级元素 */
				/* display: block; */
				margin-left: 70px;
				background-repeat: repeat-x;
			}
		</style>
	</head>
	<body>
		<div class="box">
			<div class="inpBox">
				<span>账号：</span>
				<input type="text" name="username" placeholder="请输入用户名"/>
			</div>
			<div class="inpBox">
				<span>密码：</span>
				<input type="password" name="password" placeholder="请输入密码" />
			</div>
			<div class="inpBox">
				<span>验证码：</span>
				<input type="text" name="captcha" id="captcha" placeholder="请输入验证码" style="width:85px" />
				<img src="${pageContext.request.contextPath}/captcha" style="width:85px" id="cap"/>
			</div>
			<div class="inpBox">
				<!-- <input type="submit" value="登录" class="loginInput"/> -->
				<button class="loginInput">登录</button>
			</div>
		</div>
		
		<!-- 验证码刷新 -->
		<script type="text/javascript">
			$(function(){//预加载函数，进入页面，就加载验证码
				loadCaptcha();//调用刷新验证码方法
			});
			//点击图片重新刷新验证码
			$("#cap").click(function(){
				loadCaptcha();
		    });
			//刷新验证码
			function loadCaptcha(){
				 var path = $("img").attr("src")+"?"+new Date().getTime();
				 //console.log(path);
			     $("img").attr("src",path);
			}			
		</script>
		
		<!-- 请求登录 -->
		<script type="text/javascript">
			$("button").click(function(){
				var username=$("input[name='username']").val();
				var password=$("input[name='password']").val();
				var captcha=$("input[name='captcha']").val();
				if(username==""){
					alert("请输入用户名！");
				}else{
					$.ajax({
						url:"login.do",
						type:"post",
						data:{
							username:username,
							password:password,
							captcha:captcha
						},
						dataType:"json",
						
						success:function(result){
							if(result.status){
								location.href="index.jsp";
							}else{
								alert("登陆失败,"+result.message);
							}
						}
					});
				}
			});
		</script>
	</body>
</html>
