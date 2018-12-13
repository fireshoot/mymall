<%@ page language="java" import="java.util.ArrayList,com.iss.pojo.Order"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
			<div class="user_lmt1">我的评论</div>

		</div>
		<div class="user_coment">
			<div class="my_comments">
				<ul>
					<li>
						<div class="my_co_1">
							<div class="my_co_11">
								<a href="" target="_blank"><img src="images/my_pl_img.jpg"
									width="47" height="60" /></a>
							</div>
							<div class="my_co_12">英语阅读理解与完形填空150篇：七年级阅读理解篇，快速阅读</div>
							<div class="my_co_13">2014-12-10</div>
							<div class="my_co_14">
								<a href="">删除</a>
							</div>
						</div>
						<div class="my_co_2">
							<span class="red">我的评论：</span>书籍的内容很好，很适合学生阅读，提高了学生的阅读能力，特别值得推荐
						</div>

					</li>
					<li>
						<div class="my_co_1">
							<div class="my_co_11">
								<a href="" target="_blank"><img src="images/my_pl_img.jpg"
									width="47" height="60" /></a>
							</div>
							<div class="my_co_12">英语阅读理解与完形填空150篇：七年级阅读理解篇，快速阅读</div>
							<div class="my_co_13">2014-12-10</div>
							<div class="my_co_14">
								<a href="">删除</a>
							</div>
						</div>
						<div class="my_co_2">
							<span class="red">我的评论：</span>书籍的内容很好，很适合学生阅读，提高了学生的阅读能力，特别值得推荐
						</div>

					</li>
				</ul>
				<!--分页开始 -->
				<div style="clear: both;"></div>
				<div class="fenyeys">
					<a href="">上一页</a> <a href="" class="active">1</a> <a href="">2</a>
					<a href="">3</a> <a href="">4</a> <a href="">5</a> <a href="">下一页</a>
				</div>
				<div style="clear: both;"></div>
				<!--分页结束 -->
			</div>
		</div>

	</div>
</body>
</html>