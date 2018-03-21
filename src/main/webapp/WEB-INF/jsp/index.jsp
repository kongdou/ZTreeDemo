<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../js/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="../js/jquery.ztree.core.js" type="text/javascript"></script>
<link href="../css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
<link href="../css/demo.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
</head>
<body>
	<div>
		<ul id="tree" class="ztree"></ul>
	</div>
</body>
<script type="text/javascript">
	//下面开始进入复制阶段
	var setting = {
		data : {
			key : {
				title : "title_"
			},
			simpleData : {
				enable : true
			},
		},
		view : {
			showTitle : true, //是否显示title
			showLine : true, //显示连接线
			selectedMulti : true //允许选择多个节点
		}
	};
	
	function setTitle(node) {
		var zTree = $.fn.zTree.getZTreeObj("tree");
		var nodes = node ? [ node ] : zTree.transformToArray(zTree.getNodes());
		for (var i = 0, l = nodes.length; i < l; i++) {
			var n = nodes[i];
			//title_与data.key.title保持一致
			//必须设置setting.view.showTitle为true时，才显示信息
			n.title_ = "[" + n.id + "] isFirstNode = " + n.isFirstNode
					+ ", isLastNode = " + n.isLastNode;
			zTree.updateNode(n);
		}
	}
	//后台获取数据保存
	var treeNodes = [];
	$(document).ready(function() {
		$(function() {
			var url = "http://localhost:8888/json";
			$.ajax({
				url : url,
				type : 'get',
				async : false,
				success : function(data) {
					//data为后台数据
					var msg = eval('(' + data + ')');
					$.each(msg, function(i, item) {
						$.each(item, function(ii, iit) {
							treeNodes.push({
								"id" : iit.id,
								"name" : iit.name,
								"pId" : iit.pId
							});
						});
					});
				}
			});
		});
		$.fn.zTree.init($("#tree"), setting, treeNodes);
		setTitle();
	});
</script>
</html>