<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>专业管理</title>
		<link rel="stylesheet" type="text/css" href="layui/css/layui.css"/>
		<script src="js/jquery-3.5.1.min.js"></script>
		<script src="layui/layui.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body>
		<table class="layui-hide" id="proTable" lay-filter="proTable"></table>
		
		<!-- 行按钮 -->
		<script type="text/html" id="professionEdit">
  			<a class="layui-btn layui-btn-xs layui-anim layui-anim-up" lay-event="edit">编辑</a>
 			<a class="layui-btn layui-btn-danger layui-btn-xs layui-anim layui-anim-up" lay-event="del">删除</a>
		</script>
		
		<!-- 头按钮 -->
		<script type="text/html" id="professionAdd">
			<div class="layui-btn-container">
				<button class="layui-btn layui-btn-sm layui-anim layui-anim-scaleSpring" lay-event="add">添加专业</button>
			</div>
		</script>
		
		<!-- 添加专业弹出层 -->
		<script type="text/html" id="proAddPanel">
			<form class="layui-form" id="proAddPanel" lay-filter="proAddPanel">
			 	<div class="layui-form-item">
    				<label class="layui-form-label">专业名称</label>
    				<div class="layui-input-inline">
      					<input type="text" name="pName" required  lay-verify="required" placeholder="请输入专业名称" autocomplete="off" class="layui-input">
   					 </div>
  				</div>
			</form>
		</script>
		
		<!-- 修改专业弹出层 -->
		<script type="text/html" id="updateProPanel">
			<form class="layui-form" id="updateProPanel" lay-filter="updateProPanel">
			 	<div class="layui-form-item">
    				<label class="layui-form-label">专业名称</label>
    				<div class="layui-input-inline">
      					<input type="text" name="pName" required  lay-verify="required" placeholder="请输入专业名称" autocomplete="off" class="layui-input">
   					 </div>
  				</div>

			 	<div class="layui-form-item">
    				<label class="layui-form-label">专业人数</label>
    				<div class="layui-input-inline">
      					<input type="text" name="count" required  lay-verify="required" placeholder="请输入专业人数" autocomplete="off" class="layui-input">
   					 </div>
  				</div>

			 	<div class="layui-form-item">
    				<label class="layui-form-label">创建时间</label>
    				<div class="layui-input-inline">
      					<input type="text" name="createtime" required  lay-verify="required" placeholder="请输入专业人数" autocomplete="off" class="layui-input" readonly>
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
				  ,elem: '#proTable'//	指定原始 table 容器的选择器或 DOM
				  ,url: 'selectAllPro.do' //数据接口
				  ,toolbar: '#professionAdd'
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
		      {field: 'pName', title: '专业名称', sort: true, fixed: 'left'}
		      ,{field: 'count', title: '专业人数'}
		      ,{field: 'createtime', title: '创建时间', sort: true}
		      ,{title: '操作',toolbar:'#professionEdit'}
		    ]],
		  	limits:[5,10,15,20],//自定义每页显示条数
	    	page: true//开启分页效果
		  });
		  
		  //监听行工具事件
		  table.on('tool(proTable)', function(obj){
		    var pid = obj.data.pid;//获得当前选中行的pid
		    var pName=obj.data.pName;//获得专业名称
		    var count=obj.data.count;//获取专业人数
		    var createtime=obj.data.createtime;//获得创建时间
		    if(obj.event === 'del'){
		      layer.confirm('您确定要删除吗？', function(index){
		    	  
		    	  //Ajax请求删除数据
		        $.post("deleteProById.do",{pid:pid},function(result){
		        	if(result.status){
		        		table.reload("proTable",{});//重新加载表格
		        		layer.close(index);//关闭弹出框
		        	}else{
		        		layer.msg(result.message);//弹出结果返回的信息
		        	}
		        	},"json");
		    	  
		      });
		    } else if(obj.event === 'edit'){
				layer.open({
					type:"1"//设置弹出为页面层
					,title:"修改专业"
					,anim:1
				  ,content: $("#updateProPanel").html()
				  ,btn: ['保存', '重置', '取消']
				  ,yes: function(index, layero){
					  var profession=form.val("updateProPanel");//获取form修改后的值
					  profession.pid=pid; //给专业信息附加pid键
					  console.log(profession);
					  var proStr=JSON.stringify(profession);//将json对象转换成json字符串
			    	  //Ajax请求修改数据
				        $.post("updatePro.do",{proStr:proStr},function(result){
				        	if(result.status){
				        		table.reload("proTable",{});//重新加载表格
				        		layer.close(index);//关闭弹出框
				        	}else{
				        		layer.msg(result.message);//弹出结果返回的信息
				        	}
				        	},"json");
				  }
				  ,btn2: function(index, layero){
					  form.val("updateProPanel",{
						  "pName":"",
						  "count":""
					  });
				    return false //开启该代码可禁止点击该按钮关闭
				  }
				  ,btn3: function(index, layero){
				  }
				  ,success: function(){
					  form.val("updateProPanel",{
						  "pid":pid,
						  "pName":pName,
						  "count":count,
						  "createtime":createtime
					  })
					  form.render();//渲染form表单,如果不写这句话，单选、下拉菜单、复选等功能将不会实现
				  }
				});
		    }
		  });
		  
		//头工具栏事件
		  table.on('toolbar(proTable)', function(obj){
			  
			  /* 完成专业信息添加 */
				if(obj.event==="add"){
					layer.open({
							type:"1"//设置弹出为页面层
							,title:"添加专业"
							,anim:4
						  ,content: $("#proAddPanel").html()
						  ,btn: ['保存', '重置', '取消']
						  ,yes: function(index, layero){
							  var pName=$("input[name='pName']").val();
							  
					    	  //Ajax请求删除数据
						        $.post("insertPro.do",{pName:pName},function(result){
						        	if(result.status){
						        		table.reload("proTable",{});//重新加载表格
						        		layer.close(index);//关闭弹出框
						        	}else{
						        		layer.msg(result.message);//弹出结果返回的信息
						        	}
						        	},"json");
						  }
						  ,btn2: function(index, layero){
							  form.val("proAddPanel",{
								  "pName":""
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
