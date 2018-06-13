<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base  href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}/ClothShoppingManage/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/icon.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
</head>


</head>
<body>

<table class="easyui-datagrid"  style="width:100%;height:500px;position: relative;top: -20px"
			data-options="singleSelect:true,collapsible:true,url:'datagrid_data1.json',method:'get'">
		<thead>
			<tr>
				<th data-options="field:'itemid',width:110,align:'center'">商品ID</th>
				<th data-options="field:'productid',width:110,align:'center'">类型</th>
				<th data-options="field:'listprice',width:110,align:'center'">品牌</th>
				<th data-options="field:'unitcost',width:110,align:'center'">名字</th>
				<th data-options="field:'attr1',width:110,align:'center'">价格</th>
				<th data-options="field:'status',width:110,align:'center'">库存</th>
				<th data-options="field:'itemid',width:200,align:'center'">描述</th>
				<th data-options="field:'itemid',width:110,align:'center'">首图</th>
				<th data-options="field:'itemid',width:110,align:'center'">适用人群</th>
			</tr>
		</thead>
	</table>


</body>
</html>