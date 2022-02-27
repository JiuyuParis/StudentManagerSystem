<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>年级管理</title>
		<link rel="stylesheet" type="text/css" href="layui/css/layui.css"/>
		<script src="js/jquery-3.5.1.min.js"></script>
	</head>
	<body>
		<table class="layui-hide" id="gradeTable" lay-filter="gradeTable"></table>
		
		<!-- 行按钮 -->
		<script src="layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/html" id="gradeEdit">
  			<a class="layui-btn layui-btn-xs layui-anim layui-anim-up" lay-event="edit">编辑</a>
 			<a class="layui-btn layui-btn-danger layui-btn-xs layui-anim layui-anim-up" lay-event="del">删除</a>
		</script>
		
		<!-- 头按钮 -->
		<script type="text/html" id="gradeAdd">
			<div class="layui-btn-container">
				<button class="layui-btn layui-btn-sm layui-anim layui-anim-scaleSpring" lay-event="add">添加年级</button>
			</div>
		</script>
		
		<!-- 添加/修改年级弹出层 -->
		<script type="text/html" id="gradeAddPanel">
			<form class="layui-form" id="gradeAddPanel" lay-filter="gradeAddPanel">
			 	<div class="layui-form-item">
    				<label class="layui-form-label">年级名称</label>
    				<div class="layui-input-inline">
      					<input type="text" name="grade" required  lay-verify="required" placeholder="请输入年级名称" autocomplete="off" class="layui-input">
   					 </div>
  				</div>
			</form>
		</script>
		
		<!-- 修改年级弹出层 -->
		<script type="text/html" id="updateGradePanel">
			<form class="layui-form" id="updateGradePanel" lay-filter="updateGradePanel">
			 	<div class="layui-form-item">
    				<label class="layui-form-label">年级</label>
    				<div class="layui-input-inline">
      					<input type="text" name="grade" required  lay-verify="required" placeholder="请输入年级名称" autocomplete="off" class="layui-input" readonly>
   					 </div>
  				</div>

			 	<div class="layui-form-item">
    				<label class="layui-form-label">年级人数</label>
    				<div class="layui-input-inline">
      					<input type="text" name="stuCount" required  lay-verify="required" placeholder="请输入专业名称" autocomplete="off" class="layui-input">
   					 </div>
  				</div>
			</form>
		</script>
		
		<script>
		layui.use(['table','layer','form'], function(){
		  var table = layui.table;
		  var layer=layui.layer;
		  var form=layui.form;
		  //向table表格加载数据
		  table.render({
			skin: 'line' //行边框风格
			 ,even: true //开启隔行背景
			 ,size: 'sm' //小尺寸的表格
		    ,elem: '#gradeTable'//	指定原始 table 容器的选择器或 DOM
		    ,url: 'selectAllGrade.do' //数据接口
		    ,toolbar:"#gradeAdd"//绑定头部按钮
		    ,page: true //开启分页
			,parseData: function(res){ //res 即为原始返回的数据
			    return {
			      "code": 0, //解析接口状态
			      "msg": res.message, //解析提示文本
			      "count": res.total, //解析数据长度
			      "data": res.list //解析数据列表
			    };
			  }
		    ,cols: [[ //表头
		      {field: 'grade', title: '年级', sort: true, fixed: 'left'}
		      ,{field: 'stuCount', title: '学生人数', sort: true}
		      ,{title: '操作',toolbar:'#gradeEdit'}
		    ]],
		  	limits:[5,10,15,20],//自定义每页显示条数
	    	page: true//开启分页效果
		  });
		  
		  //监听行工具事件
		  table.on('tool(gradeTable)', function(obj){
		    var gid = obj.data.gid;//获得当前选中行的gid
		    var grade=obj.data.grade;//获得年级号
		    var stuCount=obj.data.stuCount;//获得年级人数
		    if(obj.event === 'del'){
		      layer.confirm('您确定要删除吗？', function(index){
		    	  
		    	  //Ajax请求删除数据
		        $.post("deleteGradeByPid.do",{gid:gid},function(result){
		        	if(result.status){
		        		table.reload("gradeTable",{});//重新加载表格
		        		layer.close(index);//关闭弹出框
		        	}else{
		        		layer.msg(result.message);//弹出结果返回的信息
		        	}
		        	},"json");
		    	  
		      });
		    } else if(obj.event === 'edit'){
				layer.open({
					type:"1"//设置弹出为页面层
					,title:"修改年级"
					,anim:1
				  ,content: $("#updateGradePanel").html()
				  ,btn: ['保存', '重置', '取消']
				  ,yes: function(index, layero){
					  var gradeForm=form.val("updateGradePanel");//获取form修改后的值
					  gradeForm.gid=gid;//给专业信息附加pid键
					  var gradeStr=JSON.stringify(gradeForm);//将json对象转换成json字符串
			    	  //Ajax请求修改数据
				        $.post("updateGrade.do",{gradeStr:gradeStr},function(result){
				        	if(result.status){
				        		table.reload("gradeTable",{});//重新加载表格
				        		layer.close(index);//关闭弹出框
				        	}else{
				        		layer.msg(result.message);//弹出结果返回的信息
				        	}
				        	},"json");
				  }
				  ,btn2: function(index, layero){
					  form.val("updateGradePanel",{
						  "stuCount":""
					  });
				    return false //开启该代码可禁止点击该按钮关闭
				  }
				  ,btn3: function(index, layero){
				  }
				  ,success: function(){
					  form.val("updateGradePanel",{
						  "gid":gid,
						  "grade":grade,
						  "stuCount":stuCount
					  })
					  form.render();//渲染form表单,如果不写这句话，单选、下拉菜单、复选等功能将不会实现
				  }
				});
		    }
		  });
		  
			//头工具栏事件
		  table.on('toolbar(gradeTable)', function(obj){
			  
			  /* 完成年级信息添加 */
				if(obj.event==="add"){
					layer.open({
							type:"1"//设置弹出为页面层
							,title:"添加年级"
							,anim:4
						  ,content: $("#gradeAddPanel").html()
						  ,btn: ['保存', '重置', '取消']
						  ,yes: function(index, layero){
							  var grade=$("input[name='grade']").val();
							  console.log(typeof(grade));
							  console.log(grade);
					    	  //Ajax请求删除数据
						        $.post("insertGrade.do",{grade:grade},function(result){
						        	if(result.status){
						        		table.reload("gradeTable",{});//重新加载表格
						        		layer.close(index);//关闭弹出框
						        	}else{
						        		layer.msg(result.message);//弹出结果返回的信息
						        	}
						        	},"json");
						  }
						  ,btn2: function(index, layero){
							  form.val("gradeAddPanel",{
								  "grade":""
							  });
						    return false //开启该代码可禁止点击该按钮关闭
						  }
						  ,btn3: function(index, layero){
						  }
						  ,success: function(){ 
							  form.render();//渲染form表单,如果不写这句话，单选、下拉菜单、复选等功能将不会实现
						  }
						});
				}
		  });
			
		});
		</script>
	</body>
</html>
