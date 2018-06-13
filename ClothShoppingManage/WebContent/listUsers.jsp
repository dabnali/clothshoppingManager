<%@ page language="java" pageEncoding="utf-8" isELIgnored="false"%>  
<%  
    String path = request.getContextPath();  
%>  
<%@ taglib prefix="s" uri="/struts-tags"%>  
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<title>所有用户</title>  
<script type="text/javascript" src="js/jquery.min.js"></script>  
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>  
<script type="text/javascript" src="locale/easyui-lang-zh_CN.js"></script>  
<link rel="stylesheet" href="themes/default/easyui.css"  
    type="text/css" charset="utf-8"></link>  
<link rel="stylesheet" href="themes/icon.css" type="text/css"  
    charset="utf-8"></link>  
</head>  
<script type="text/javascript">  
    function doSearch(value,name){ //用户输入用户名,点击搜素,触发此函数  
        $("#tt").datagrid({  
            title:'搜索用户',  
            iconCls:'icon-ok',  
            width:1110,  
            height:430,
            pageSize:10,  
            pageList:[5,10,15,20],  
            nowrap:true,  
            striped:true,  
            collapsible:true,  
            toolbar:"#easyui_toolbar",  
            url:'admin/UserAction!listUserByPage.action', 
            //触发此action,带上参数 
            loadMsg:'数据加载中......',  
            fitColumns:true,//允许表格自动缩放,以适应父容器  
            //sortName:'consumer_id',  
            sortOrder:'asc',  
            remoteSort:false,  
            columns : [ [/*  {  
                field : 'consumer_id',  
                width : 100,  
                title : 'id'  
            }, */ {  
                field : 'consumer_name',  
                width : 100,  
                title : '昵称'  
            }, {  
                field : 'consumer_pwd',  
                width : 100,  
                title : '密码'  
            },{  
                field : 'consumer_sex',  
                width : 100,  
                title : '性别'  
            },{  
                field : 'consumer_tel',  
                width : 100,  
                title : '电话'  
            },{  
                field : 'consumer_introduce',  
                width : 180,  
                title : '介绍'  
            },{  
                field : 'consumer_img',  
                width : 100,  
                title : '头像'  
            },{  
                field : 'consumer_vip',  
                width : 100,  
                title : 'vip'  
            }] ],  
            pagination : true,  
            rownumbers : true  
        })  
    }  
      
</script>  
<body>  
       <div class="easyui-panel" 
        icon="icon-save" style="width: 1110px; height: 460px;">  
   
        <div class="easyui-layout" fit="true"  >  
            <div  id="easyui_toolbar" region="north" border="false"  
                style="border-bottom: 1px solid #ddd; height: 32px; padding: 2px 5px; background: #fafafa;">  
                <div style="float: left;">  
                    <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add">新增</a>  
                </div>  
  
                <div class="datagrid-btn-separator"></div>  
  
                <div style="float: left;">  
                    <a href="#" class="easyui-linkbutton" plain="true" icon="icon-save">编辑</a>  
                </div>  
  
                <div class="datagrid-btn-separator"></div>  
  
                <div style="float: left;height：32px">  
                    <a href="#" class="easyui-linkbutton" plain="true"  
                        icon="icon-remove">删除</a>  
                </div>  
  
                <div id="tb" style="float: right;">  
                    <input id="ss" class="easyui-searchbox"  
                        searcher="doSearch" prompt="请输入用户名"  
                        style="width: 130px; vertical-align: middle;"></input>   
                </div>  
  
            </div>  
            <div region="center" border="false">  
                <table id="tt"></table>  
            </div>  
  
         </div>  
    	</div>  
    <script>  
        $('#tt').datagrid({  
            width:1110,  
            height:430,
            pageSize:10,  
            pageList:[10,20,30,40],  
            nowrap:true,  
            striped:true,  
            collapsible:true,  
            toolbar:"#easyui_toolbar",  
            //url : './datagrid/userData.json',  
            url:'admin/UserAction!listUserByPage.action', //搜索前,触发此action请求所有用户信息  
            loadMsg:'数据加载中......',  
            fitColumns:true,//允许表格自动缩放,以适应父容器  
            //sortName:'consumer_id',  
            sortOrder:'asc',  
            remoteSort:false,  
            columns : [ [  /* {  
                field : 'consumer_id',  
                width : 100,  
                title : 'id'  
            },  */ {  
                field : 'consumer_name',  
                width : 100,  
                title : '昵称'  
            }, {  
                field : 'consumer_pwd',  
                width : 100,  
                title : '密码'  
            },{  
                field : 'consumer_sex',  
                width : 100,  
                title : '性别'  
            },{  
                field : 'consumer_tel',  
                width : 100,  
                title : '电话'  
            },{  
                field : 'consumer_introduce',  
                width : 180,  
                title : '介绍'  
            },{  
                field : 'consumer_img',  
                width : 100,  
                title : '头像'  
            },{  
                field : 'consumer_vip',  
                width : 100,  
                title : 'vip'  
            }] ],  
            pagination : true,  
            rownumbers : true  
        });  
    </script>  
<script>
		(function($){
			function pagerFilter(data){
				if ($.isArray(data)){	// is array
					data = {
						total: data.length,
						rows: data
					}
				}
				var target = this;
				var dg = $(target);
				var state = dg.data('datagrid');
				var opts = dg.datagrid('options');
				if (!state.allRows){
					state.allRows = (data.rows);
				}
				if (!opts.remoteSort && opts.sortName){
					var names = opts.sortName.split(',');
					var orders = opts.sortOrder.split(',');
					state.allRows.sort(function(r1,r2){
						var r = 0;
						for(var i=0; i<names.length; i++){
							var sn = names[i];
							var so = orders[i];
							var col = $(target).datagrid('getColumnOption', sn);
							var sortFunc = col.sorter || function(a,b){
								return a==b ? 0 : (a>b?1:-1);
							};
							r = sortFunc(r1[sn], r2[sn]) * (so=='asc'?1:-1);
							if (r != 0){
								return r;
							}
						}
						return r;
					});
				}
				var start = (opts.pageNumber-1)*parseInt(opts.pageSize);
				var end = start + parseInt(opts.pageSize);
				data.rows = state.allRows.slice(start, end);
				return data;
			}

			var loadDataMethod = $.fn.datagrid.methods.loadData;
			var deleteRowMethod = $.fn.datagrid.methods.deleteRow;
			$.extend($.fn.datagrid.methods, {
				clientPaging: function(jq){
					return jq.each(function(){
						var dg = $(this);
                        var state = dg.data('datagrid');
                        var opts = state.options;
                        opts.loadFilter = pagerFilter;
                        var onBeforeLoad = opts.onBeforeLoad;
                        opts.onBeforeLoad = function(param){
                            state.allRows = null;
                            return onBeforeLoad.call(this, param);
                        }
                        var pager = dg.datagrid('getPager');
						pager.pagination({
							onSelectPage:function(pageNum, pageSize){
								opts.pageNumber = pageNum;
								opts.pageSize = pageSize;
								pager.pagination('refresh',{
									pageNumber:pageNum,
									pageSize:pageSize
								});
								dg.datagrid('loadData',state.allRows);
							}
						});
                        $(this).datagrid('loadData', state.data);
                        if (opts.url){
                        	$(this).datagrid('reload');
                        }
					});
				},
                loadData: function(jq, data){
                    jq.each(function(){
                        $(this).data('datagrid').allRows = null;
                    });
                    return loadDataMethod.call($.fn.datagrid.methods, jq, data);
                },
                deleteRow: function(jq, index){
                	return jq.each(function(){
                		var row = $(this).datagrid('getRows')[index];
                		deleteRowMethod.call($.fn.datagrid.methods, $(this), index);
                		var state = $(this).data('datagrid');
                		if (state.options.loadFilter == pagerFilter){
                			for(var i=0; i<state.allRows.length; i++){
                				if (state.allRows[i] == row){
                					state.allRows.splice(i,1);
                					break;
                				}
                			}
                			$(this).datagrid('loadData', state.allRows);
                		}
                	});
                },
                getAllRows: function(jq){
                	return jq.data('datagrid').allRows;
                }
			})
		})(jQuery);

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
		
		$(function(){
			$('#tt').datagrid({data:getData()}).datagrid('clientPaging');
		});
	</script>
  
</body>  
</html>  