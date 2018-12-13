<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>支付确认</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	type="text/css" rel="stylesheet" />
<script type="text/javascript">
	window.onload = function() {
		var i = 5;
		setInterval(function() {
					--i;
					if (i == 0) {
						window.location.href = "${pageContext.request.contextPath}/book?method=toIndex";
						return;
					}
					document.getElementById("second").innerHTML = i;
				}, 1000);
	}
</script>
</head>
<body>
	<!--top begin -->
	<div class="header">

		<!--nav begin -->
		<div class="nav">
			<div class="warp"></div>
		</div>
		<!--nav end -->
		<div class="clearfloat"></div>
	</div>
	<!--top end -->
	<!--container begin -->
	<div class="container">

		<div
			style="height: 150px; text-align: center; font-size: large; line-height: 150px;">
			<span style="color: green;">支付成功</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
				id="second">5</span>秒后跳转到首页&nbsp;<a style="color: blue;"
				href="${pageContext.request.contextPath}/book?method=toIndex">(点击直接跳转)</a>
		</div>
	</div>
</body>
</html>