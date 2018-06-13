<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base  href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}/ClothShoppingManage/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="themes/icon.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>


</head>
<body>
<div style="margin:20px 0;"></div>
	<div class="easyui-panel"  style="width:100%;max-width:400px;padding:30px 60px;">
		<form id="ff" class="easyui-form" method="post" data-options="novalidate:true">
		   
			<div style="margin-bottom:20px">
				<input class="easyui-textbox" name="consumer_name" style="width:100%" data-options="label:'昵称:',required:true">
			</div>
			<div style="margin-bottom:20px">
				<input class="easyui-textbox" name="consumer_pwd" style="width:100%" data-options="label:'密码:',required:true">
			</div>
			<div style="margin-bottom:20px">
				<input class="easyui-textbox" name="consumer_introduce" style="width:100%;height:60px" data-options="label:'介绍:'">
			</div>
			<div style="margin-bottom:20px">
				<select class="easyui-combobox" name="consumer_sex" label="性别:" style="width:100%">
				<option value="man">男</option><option value="woman">女</option></select>
			</div>
			<div style="margin-bottom:20px">
				<input class="easyui-textbox" name="consumer_tel" style="width:100%" data-options="label:'电话:'">
			</div>
			
			</div>
				
		</form>
		<div style="text-align:left;padding:5px 0">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">Submit</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width:80px">Clear</a>
		</div>
	</div>
	<script>
		function submitForm(){
			$('#ff').form('submit',{
				onSubmit:function(){
					return $(this).form('enableValidation').form('validate');
				}
			});
		}
		function clearForm(){
			$('#ff').form('clear');
		}
	</script>


</body>
</html>