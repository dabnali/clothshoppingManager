<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base  href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}/ClothShoppingManage/">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>登录</title>
	<link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="themes/icon.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
</head>
<body>
	<div style="margin:auto;width:400px;margin-top:150px">
		<div class="easyui-panel" title="用户登录" style="width:100%;max-width:400px;padding:30px 60px;">
			<form id="ff" method="post" action="admin/UserAction!login.action">
				<div style="margin-bottom:20px">
					<input class="easyui-textbox" name="u.account" prompt="Account" iconWidth="28" style="width:100%;height:34px;padding:10px;" data-options="required:true">
				</div>
				<div style="margin-bottom:20px">
					<input class="easyui-passwordbox" name="u.password" prompt="Password" iconWidth="28" style="width:100%;height:34px;padding:10px">
				</div>
				<div style="margin-bottom:20px">
					<input class="easyui-textbox" name="code" style="width:60%" data-options="label:'验证码:',required:false">
					<span style="width:60%;height:34px;">12346</span>
				</div>
			</form>
			<div style="text-align:center;padding:5px 0">
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">提交</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width:80px">清空</a>
			</div>
		</div>
	</div>
	<script>
		function submitForm(){
			$('#ff').form('submit');
		}
		function clearForm(){
			$('#ff').form('clear');
		}
	</script>
</body>
</html>