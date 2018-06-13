<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>购物车商城后台管理平台-首页</title>
	<link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="themes/icon.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
</head>
<body class="easyui-layout">
	<!-- 顶部标题部分 -->
	<div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px">
		<span style="font-weight:bold; font-size: 30px;font-family:'宋体';margin-right: 50px;text-shadow: -1px -1px 10px blue;">购物车商城后台管理平台</span>
		<!-- 管理员登录信息显示 -->
		<span>
			<img src="" style="width:30px;height:30px;border:1px solid blue;border-radius:15px;position:relative;top:10px;"/>
			欢迎您!<a href="admin/UserAction!logOut.action">注销</a>
		</span>
	</div>
	<!-- 功能菜单部分 -->
	<div data-options="region:'west',split:true,title:'菜单栏'" style="width:200px;padding:10px;">
		<ul class="easyui-tree" id="menutree">
			<li>
				<span>所有功能</span>
				<ul>
					<li data-options="state:'closed'">
						<span>订单管理</span>
						<ul>
							<li>
								<span>所有订单</span>
							</li>
							<li>
								<span>修改订单</span>
							</li>
							<li>
								<span>删除订单</span>
							</li>
						</ul>
					</li>
					<li data-options="state:'closed'">
						<span>商品管理</span>
						<ul>
							<li>
								<span>所有商品</span>
							</li>
							<li>
								<span>添加商品</span>
							</li>
							<li>
								<span>修改商品</span>
							</li>
							<li>
								<span>删除商品</span>
							</li>
						</ul>
					</li>
					<li data-options="state:'closed'">
						<span>用户管理</span>
						<ul>
							<li>
								<span>所有用户</span>
							</li>
							<li>
								<span>添加用户</span>
							</li>
							<li>
								<span>修改用户</span>
							</li>
							<li>
								<span>查找用户</span>
							</li>
						</ul>
					</li>
					<li data-options="state:'closed'">
						<span>个人中心</span>
						<ul>
							<li>
								<span>修改资料</span>
							</li>
						</ul>
					</li>
					<li>index.html</li>
					<li>about.html</li>
					<li>welcome.html</li>
				</ul>
			</li>
		</ul>
	</div>
	<!-- 公告部分 -->
	<div data-options="region:'east',split:true,collapsed:true,title:'公告'" style="width:100px;padding:10px;">
		<p>好好学习</p>
		<p>天天向上</p>
	</div>
	<!-- 底部导航部分 -->
	<div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding:10px;">
		<a href="http://localhost:8888/ClothShoppingManager/index.jsp">网站首页</a>
		<a href="#">公司信息</a>
		<a href="#">系统说明</a>
	</div>
	<!-- 中间主要内容显示部分 -->
	<div data-options="region:'center'">
		<div id="main" class="easyui-tabs" style="width:100%;height:100%">
			<div title="系统通知" data-options="iconCls:'icon-help',closable:true" style="padding:10px">
					<ul class="easyui-datalist" title="公司消息" lines="true" style="width:100%;height:100%">
						<li value="AL">Alabama</li>
						<li value="AK">Alaska</li>
						<li value="AZ">Arizona</li>
					</ul>
				</div>
		</div>
	</div>
	
	
	<script type="text/javascript">
		function addPanel(titles,url){
			if ($('#main').tabs('exists', titles)){
				$('#main').tabs('select', titles);
			} else {
				var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
				$('#main').tabs('add',{
					title:titles,
					content:content,
					closable:true
				});
			}
		}
		//处理功能菜单点击事件
		$(document).ready(function(){
			$('#menutree').tree({
				onClick: function(node){
					if(node.text=='所有订单'){
						addPanel(node.text,"showOrder.jsp");
					}
					if(node.text=='修改订单'){
						addPanel(node.text,"updateOrder.jsp");
					}
					if(node.text=='删除订单'){
						addPanel(node.text,"deleteOrder.jsp");
					}
					//========================================
					if(node.text=='所有商品'){
						addPanel(node.text,"showGoods.jsp");
					}
					if(node.text=='添加商品'){
						addPanel(node.text,"addGoods.jsp");
					}
					if(node.text=='修改商品'){
						addPanel(node.text,"updateGoods.jsp");
					}
					if(node.text=='删除商品'){
						addPanel(node.text,"deleteGoods.jsp");
					}
					//========================================
					if(node.text=='所有用户'){
						addPanel(node.text,"showUser.jsp");
					}
					if(node.text=='添加用户'){
						addPanel(node.text,"addUser.jsp");
					}
					if(node.text=='修改用户'){
						addPanel(node.text,"updateUser.jsp");
					}
					if(node.text=='查找用户'){
						addPanel(node.text,"searchUser.jsp");
					}
					//=========================================
					if(node.text=='修改资料'){
						addPanel(node.text,"updateManagerInfo.jsp");
					}
				}
			});
		})
	</script>
</body>
</html>