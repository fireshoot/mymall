<%@ page language="java" import="java.util.ArrayList,com.iss.pojo.Order"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.SuperSlide.2.1.1.js"></script>
</head>
<body>

	<div class="user_cont_right">

		<div class="user_lmt">
			<div class="user_lmt1">我的消息</div>

		</div>
		<div class="user_coment">
			<div class="message">
				<div class="message_1">
					<ul>
						<li><a href="getmymessage.action?page=1">返回</a></li>
						<li><a href="deletemymessage.action?id=${id}">删除</a></li>
					</ul>
				</div>
				<div class="message_2">
					<div class="message_2_1"></div>
					<div class="message_2_2">
						尊敬的${customer.cname}：</br> ${content}</br>
						<p class="ppt">此邮件为系统发送的邮件，请勿直接回复！</p>
					</div>
					<div class="message_2_3">
						<span>收件人：${customer.cname}</span> <span class="times">时间：${time}</span> <span>来自：系统消息</span>
					</div>
				</div>

			</div>

		</div>
	</div>
	<!--right end -->


	<div class="footer_m mar38">
		<div class="footer_nav">
			<a href="" target="_blank">关于我们</a>| <a href="" target="_blank">联系我们</a>|
			<a href="" target="_blank">人才招聘</a>| <a href="" target="_blank">广告服务</a>|
			<a href="" target="_blank">友情链接</a>| <a href="" target="_blank">销售联盟</a>|
			<a href="" target="_blank">公司简介</a>
		</div>
		<div class="footer_copyright">网络文化经营许可证鄂网文[2015]0278-060号
			Copyright © 2015-2018 版权所有</div>

	</div>
</body>
</html>