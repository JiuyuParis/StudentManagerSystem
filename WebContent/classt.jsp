<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>班级管理</title>
		<link rel="stylesheet" type="text/css" href="layui/css/layui.css"/>
		<script src="js/jquery-3.5.1.min.js"></script>
	</head>
	<body>
		<table class="layui-hide" id="classtTable" lay-filter="classtTable"></table>
		
		<script src="layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/html" id="gradeEdit">
  			<a class="layui-btn layui-btn-xs layui-anim layui-anim-up" lay-event="edit">编辑</a>
 			<a class="layui-btn layui-btn-danger layui-btn-xs layui-anim layui-anim-up" lay-event="del">删除</a>
		</script>
		
		<!-- 头按钮 -->
		<script type="text/html" id="classtAdd">
			<div class="layui-btn-container">
				<button class="layui-btn layui-btn-sm layui-anim layui-anim-scaleSpring" lay-event="add">添加班级</button>
			</div>
		</script>
		
		<!-- 添加班级弹出层 -->
		<script type="text/html" id="classtAddPanel">
			<form class="layui-form" id="classtAddPanel" lay-filter="classtAddPanel">
			 	<div class="layui-form-item">
    				<label class="layui-form-label">班号</label>
    				<div class="layui-input-inline">
      					<input type="text" name="classN" required  lay-verify="required" placeholder="请输入班号" autocomplete="off" class="layui-input">
   					 </div>
  				</div>
			 	<div class="layui-form-item">
    				<label class="layui-form-label">班型</label>
    				<div class="layui-input-inline">
      					<input type="text" name="classType" required  lay-verify="required" placeholder="请输入班型" autocomplete="off" class="layui-input">
   					 </div>
  				</div>
			</form>
		</script>
		
		<!-- 修改班级弹出层 -->
		<script type="text/html" id="updateClasstPanel">
			<form class="layui-form" id="updateClasstPanel" lay-filter="updateClasstPanel">
				
				<div class="layui-form-item">
    				<label class="layui-form-label">班号</label>
    				<div class="layui-input-inline">
      					<input type="text" name="classN" required  lay-verify="required" placeholder="请输入班级人数" autocomplete="off" class="layui-input" readonly>
   					 </div>
  				</div>

			 	<div class="layui-form-item">
    				<label class="layui-form-label">班级人数</label>
    				<div class="layui-input-inline">
      					<input type="text" name="classNum" required  lay-verify="required" placeholder="请输入班级人数" autocomplete="off" class="layui-input">
   					 </div>
  				</div>

			 	<div class="layui-form-item">
    				<label class="layui-form-label">班型</label>
    				<div class="layui-input-inline">
      					<input type="text" name="classType" required  lay-verify="required" placeholder="请输入班型" autocomplete="off" class="layui-input">
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
		    ,elem: '#classtTable'//	指定原始 table 容器的选择器或 DOM
		    ,url: 'selectAllClasst.do' //数据接口
		    ,toolbar:"#classtAdd"
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
		      {field: 'classN', title: '班号', sort: true, fixed: 'left'}
		      ,{field: 'classNum', title: '班级人数', sort: true}
		      ,{field: 'classType', title: '班型', sort: true}
		      ,{title: '操作',toolbar:'#gradeEdit'}
		    ]],
		  	limits:[5,10,15,20],//自定义每页显示条数
	    	page: true//开启分页效果
		  });
		  
		  //监听行工具事件
		  table.on('tool(classtTable)', function(obj){
		    var clid = obj.data.clid;//获得当前选中行的clid
		    var classN=obj.data.classN;//获得班号
		    var classNum=obj.data.classNum;//获得班级人数
		    var classType=obj.data.classType;//获得班型
		    //console.log(obj)
		    if(obj.event === 'del'){
		      layer.confirm('您确定要删除吗？', function(index){
		    	  
		    	  //Ajax请求删除数据
		        $.post("deleteClasstByClid.do",{clid:clid},function(result){
		        	if(result.status){
		        		table.reload("classtTable",{});//重新加载表格
		        		layer.close(index);//关闭弹出框
		        	}else{
		        		layer.msg(result.message);//弹出结果返回的信息
		        	}
		        	},"json");
		    	  
		      });
		    } else if(obj.event === 'edit'){
				layer.open({
					type:"1"//设置弹出为页面层
					,title:"修改班级"
					,anim:1
				  ,content: $("#updateClasstPanel").html()
				  ,btn: ['保存', '重置', '取消']
				  ,yes: function(index, layero){
					  var classt=form.val("updateClasstPanel");//获取form修改后的值
					  classt.clid=clid;//给班级信息附加clid键
					  var classtStr=JSON.stringify(classt);//将json对象转换成json字符串
			    	  //Ajax请求修改数据
				        $.post("updateClasst.do",{classtStr:classtStr},function(result){
				        	if(result.status){
				        		table.reload("classtTable",{});//重新加载表格
				        		layer.close(index);//关闭弹出框
				        	}else{
				        		layer.msg(result.message);//弹出结果返回的信息
				        	}
				        	},"json");
				  }
				  ,btn2: function(index, layero){
					  form.val("updateClasstPanel",{
						  "classNum":"",
						  "classType":""
					  });
				    return false //开启该代码可禁止点击该按钮关闭
				  }
				  ,btn3: function(index, layero){
				  }
				  ,success: function(){
					  form.val("updateClasstPanel",{
						  "clid":clid,
						  "classN":classN,
						  "classNum":classNum,
						  "classType":classType
					  })
					  form.render();//渲染form表单,如果不写这句话，单选、下拉菜单、复选等功能将不会实现
				  }
				});
		    }
		  });
		  
		//头工具栏事件
		  table.on('toolbar(classtTable)', function(obj){
			  
			  /* 完成专业信息添加 */
				if(obj.event==="add"){
					layer.open({
							type:"1"//设置弹出为页面层
							,title:"添加班级"
							,anim:4
						  ,content: $("#classtAddPanel").html()
						  ,btn: ['保存', '重置', '取消']
						  ,yes: function(index, layero){
							  var classN=$("input[name='classN']").val();
							  var classType=$("input[name='classType']").val();
					    	  //Ajax请求删除数据
						        $.post("insertClasst.do",{classN:classN,classType:classType},function(result){
						        	if(result.status){
						        		table.reload("classtTable",{});//重新加载表格
						        		layer.close(index);//关闭弹出框
						        	}else{
						        		layer.msg(result.message);//弹出结果返回的信息
						        	}
						        	},"json");
						  }
						  ,btn2: function(index, layero){
							  form.val("classtAddPanel",{
								  "classN":"",
								  "classType":""
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
