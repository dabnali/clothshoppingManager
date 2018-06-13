<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<base  href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}/ClothShoppingManage/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>所有用户</title>
    <link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="themes/icon.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
</head>

<body style="margin: 0px;padding: 5px;">
	<div style="margin:20px 0;"></div>
		<div>
		     <!-- <input  data-options="prompt:'请输入用户名...',searcher:doSearch" style="width:20% ">
		     <a href="javascript:void(0)" style="position: absolute;width:10%" class="easyui-linkbutton" data-options="iconCls:'icon-search'" >搜索</a> --> 
		<input id="dd" type="text"  style="float: left;position: relative;margin: 0px 5px 0 0px;padding: 5px 0 5px 0;height: 96%;border: 1px solid #95B8E7;margin-right: 5px;" placeholder="请输入用户名...">
		
 		<a href="javascript:void(0)" onclick="sousuo()" style="float: left;position: relative;top: -1px;width:80px;margin-left: -3px;" class="easyui-linkbutton" data-options="iconCls:'icon-search'" >搜索</a> 
		
		</div><br>
		<div style="margin:20px 0;"></div>
		
    	<table id="dg" style="width:100%;height:400px"
			data-options="singleSelect:true,pagination:true,url:'admin/UserAction!listUserByPage.action',method:'get'">
		<thead>
			<tr>
			    <th data-options="field:'consumer_id',width:120,align:'center'">ID</th>
				<th data-options="field:'consumer_name',width:120,align:'center'">昵称</th>
				<th data-options="field:'consumer_pwd',width:120,align:'center'">密码</th>
				<th data-options="field:'consumer_img',width:120,align:'center'">头像</th>				
				<th data-options="field:'consumer_tel',width:150,align:'center'">电话</th>
				<th data-options="field:'consumer_sex',width:100,align:'center'">性别</th>
				<th data-options="field:'consumer_introduce',width:190,align:'center'">介绍</th>
				<th data-options="field:'consumer_vip',width:100,align:'center'">vip</th>
			</tr>
		</thead>
	</table>
	<script type="text/javascript">
	function getData(){
		var rows = [];
		for(var i=1; i<=800; i++){
			var amount = Math.floor(Math.random()*1000);
			var price = Math.floor(Math.random()*1000);
			rows.push({
				inv: 'Inv No '+i,
				date: $.fn.datebox.defaults.formatter(new Date()),
				name: 'Name '+i,
				amount: amount,
				price: price,
				cost: amount*price,
				note: 'Note '+i
			});
		}
		return rows;
	}
	
	function pagerFilter(data){
		if (typeof data.length == 'number' && typeof data.splice == 'function'){	// is array
			data = {
				total: data.length,
				rows: data
			}
		}
		var dg = $(this);
		var opts = dg.datagrid('options');
		var pager = dg.datagrid('getPager');
		pager.pagination({
			onSelectPage:function(pageNum, pageSize){
				opts.pageNumber = pageNum;
				opts.pageSize = pageSize;
				pager.pagination('refresh',{
					pageNumber:pageNum,
					pageSize:pageSize
				});
				dg.datagrid('loadData',data);
			}
		});
		if (!data.originalRows){
			data.originalRows = (data.rows);
		}
		var start = (opts.pageNumber-1)*parseInt(opts.pageSize);
		var end = start + parseInt(opts.pageSize);
		data.rows = (data.originalRows.slice(start, end));
		return data;
	}
	
	$(function(){
		$('#dg').datagrid({loadFilter:pagerFilter}).datagrid('loadData', getData());
	});

	
		$(function(){
			var pager = $('#dg').datagrid().datagrid('getPager');	// get the pager of datagrid
			pager.pagination({
				buttons:[{
					iconCls:'icon-search',
					handler:function(){
						alert('search');
					}
				},{
					iconCls:'icon-remove',
					handler:function(){
						var n=$("#dg").datagrid('getSelected');
						var i=$('#dg').datagrid('getRowIndex', $("#dg").datagrid('getSelected'));
						if(n==null){
							$.messager.alert('温馨提示','必须选中要删除的行才能删除!','error');
						}else
						{
							$.messager.confirm('确认信息', '确认删除编号为:'+n.consumer_id+'的用户信息吗?', function(r){
								if (r){
									$.get("admin/UserAction!deleteUserInfoByUserId.action?user.id="+n.consumer_id,function(data){
											var noticeMessage='删除失败!';
											if(data==true){
												noticeMessage='删除成功!'
												$("#dg").datagrid('deleteRow',i)
											    $('#t1').datagrid('reload');  
												//alert(noticeMessage);
											}
											$.messager.show({
												title:'操作提示',
												msg:noticeMessage,
												timeout:2000,
												showType:'slide'
											});
											
											
									})
								}
							});

						}
					}
				},{
					iconCls:'icon-add',
					handler:function(){
						alert('add');
					}
				},{
					iconCls:'icon-edit',
					handler:function(){
						alert('edit');
					}
				}]
			});			
		})
		
		function sousuo(){
			var value=$("#dd").val();
			$.get("admin/UserAction!searchByName.action?key="+value,function(data){
				alert(data[0].consumer_id);
			});
		}
	</script>
	
			

		

</body>
</html>