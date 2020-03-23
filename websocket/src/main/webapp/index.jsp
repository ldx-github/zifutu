<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="${APP_PATH}/static/js/echarts.js"></script>
<script src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
<style>
body {
	margin: 0;
	text-align: center;
}
	#zifu{
	font-family:monospace;
	font-size: 15px;
	line-height: 8px;
	white-space: pre;
	display: inline-block;
}
</style>
</head>
<body>
	选择图片地址:<input type="text" id="dizhi">
	<input onclick=zifu() type="button" value="提交">
	<div id="zifu">
	</div>
</body>
<script>
	function zifu(){
		$.ajax({
			url:"${APP_PATH}/zifu",
			type:"get",
			data:{
				name:$("#dizhi").val(),
			},
			dataType:"text",
			success:function(result){
				$("#zifu").empty();
				$("#zifu").append(result);
			}
		})
	}
</script>
</html>