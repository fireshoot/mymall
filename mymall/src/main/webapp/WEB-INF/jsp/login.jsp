<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登陆</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	type="text/css" rel="stylesheet" />

<script type="text/javascript">
	if (window != top)

		top.location.href = location.href;
</script>

</head>

<body class="body_login">
	<div class="login_t">
		<div class="login_title">欢迎登陆</div>
		<div class="login_txt">
			<img src="${pageContext.request.contextPath}/images/login_03.jpg"
				width="285" height="26" />
		</div>
	</div>
	<div class="login_c">
		<div class="login_c_left">
			<img src="${pageContext.request.contextPath}/images/login_f.jpg"
				width="369" height="314" />
		</div>
		<div class="login_c_right">
			<div style="color: red;">${errMsg }</div>
			<form
				action="${pageContext.request.contextPath}/customer/login.action"
				method="post">
				<dl>
					<dt>账&nbsp;&nbsp;&nbsp;号：</dt>
					<dd>
						<input name="cname" type="text" class="username"
							value="${customer.cname}" />
					</dd>
				</dl>
				<dl>
					<dt>密&nbsp;&nbsp;&nbsp;码：</dt>
					<dd>
						<input name="password" type="password" class="password" />
					</dd>
				</dl>
				<dl>
					<dt>验证码：</dt>
					<dd>
						<input name="vcode" type="text" class="yzm_txt" />
						<div class="yzm">
							<img src="${pageContext.request.contextPath}/getVcode.action"
								width="82" height="30" />
						</div>
						<div class="yzm_ot">
							<a href="">看不清换一张</a>
						</div>
					</dd>
				</dl>
				<div class="login_butt">
					<input type="submit" class="bts" value="登陆" /> <input type="reset"
						class="bts" value="取消" />
				</div>
			</form>
			<div class="login_zc">
				<a href="topassword1.action" target="_blank" class="login_zc1">忘记登陆密码</a>
				<a href="${pageContext.request.contextPath }/customer/zhuce.action"
					class="login_zc2">免费注册</a>
			</div>
		</div>
	</div>
	<div class="footer_m mar38">
		<div class="footer_nav">
			<a href="" target="_blank">关于我们</a>| <a href="" target="_blank">联系我们</a>|
			<a href="" target="_blank">人才招聘</a>| <a href="" target="_blank">广告服务</a>|
			<a href="" target="_blank">友情链接</a>| <a href="" target="_blank">销售联盟</a>|
			<a href="" target="_blank">公司简介</a>
		</div>
		<div class="footer_copyright">网络文化经营许可证鄂网文[2018]0278-060号
			Copyright © 2018 版权所有</div>
	</div>
</body>
</html>