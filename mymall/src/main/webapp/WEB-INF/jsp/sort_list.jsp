<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>搜索详情</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.jqzoom.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/base.js"></script>

<script type="text/javascript">
	$(function() {
		$('.nav_left').mouseover(function() {
			$('.category_ho').show();
		}).mouseout(function() {

			$('.category_ho').hide();
		});

	});

	function submit(arg) {
		var bookForm = document.getElementById("bookForm");
		if (arg == 1) {
			bookForm.action = "${pageContext.request.contextPath}/book?method=toBuy";
		} else if (arg == 2) {
			bookForm.action = "${pageContext.request.contextPath}/book?method=toCart";
		}
		bookForm.submit();
	}

	function add(num) {
		num = parseInt(num);
		var buyNum = document.getElementById("buy-num");
		var stock = parseInt("${book.stock}");
		if (num == 1) {
			buyNum.value = parseInt(buyNum.value) + 1;
		} else if (num == -1) {
			alert(buyNum.value);
			buyNum.value = parseInt(buyNum.value) - 1;
		}
		if (buyNum.value < 1) {
			buyNum.value = 1;
		} else if (buyNum.value > stock) {
			alert("购买的数量已经超出库存");
			buyNum.value = stock;
		}
	}

	function checkNum() {
		var buyNum = document.getElementById("buy-num");
		var stock = parseInt("${book.stock}");
		var num = buyNum.value;
		var regex = /^\d+$/;
		var flag = regex.test(num);
		if (!flag) {
			buyNum.value = 1;
		}
		if (parseInt(buyNum.value) > stock) {
			buyNum.value = stock;
		}
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<!--container begin -->
	<div class="container">
		<!--banner begin -->
		<div class="list_banner">
			<a href="" target="_blank"><img
				src="${pageContext.request.contextPath}/images/list_banner.jpg"
				width="1100" height="92"></a>
		</div>
		<!--banner end -->
		<div class="list_dq">
			<a href="" target="_blank">购书网</a> &gt; <a href="" target="_blank">图书
				<!-- 	</a>&gt; <a href="" target="_blank">中小学教辅</a> &gt;小学一年级 -->
		</div>
		<!--fenlei begin -->
		<div class="list_fl">
			<dl>
				<dt>科目：</dt>
				<dd>
					<a href="" target="_blank" class="active">语文</a> <a href=""
						target="_blank">数学</a> <a href="" target="_blank">英语</a> <a
						href="" target="_blank">其他科目</a>
				</dd>
			</dl>
			<dl>
				<dt>价格：</dt>
				<dd>
					<a href="" target="_blank" class="active">1-3元</a> <a href=""
						target="_blank">3-9元 </a> <a href="" target="_blank">9-10元</a> <a
						href="" target="_blank">10元以上</a>
				</dd>
			</dl>
			<dl style="border-bottom: none;">
				<dt>折扣：</dt>
				<dd>
					<a href="" target="_blank" class="active">3折以下</a> <a href=""
						target="_blank">3-5折</a> <a href="" target="_blank">5-7折</a> <a
						href="" target="_blank">7折以上</a>
				</dd>
			</dl>
		</div>
		<!--fenlei end -->
		<!--paixu begin -->
		<div class="paixu">
			<div class="number">

				共有<span class="red">${number}</span>个商品
			</div>
			<ul id="test_fu">

				<li class="li1">排序</li>
				<li id="number11" class="active"><a href="">默认排序</a></li>
				<li id="number22"><a
					href="${pageContext.request.contextPath}/book/sort_best.action?ispage=0&id=1&grade=${grade}&special=${special}&flag=${flag}&page=1">销量<b><img
							src="${pageContext.request.contextPath}/images/list_jtx.jpg"
							width="7" height="8"></b></a></li>
				<li id="number33"><a
					href="${pageContext.request.contextPath}/book/sort_best.action?ispage=0&id=2&grade=${grade}&special=${special}&flag=${flag}&page=1">价格<b><img
							src="${pageContext.request.contextPath}/images/list_jts.jpg"
							width="7" height="8"></b></a></li>
				<li id="number44"><a
					href="${pageContext.request.contextPath}/book/sort_best.action?ispage=0&id=3&grade=${grade}&special=${special}&flag=${flag}&page=1">出版时间<b><img
							src="${pageContext.request.contextPath}/images/list_jtx.jpg"
							width="7" height="8"></b></a></li>
			</ul>
		</div>
		<!--paixu end -->
		<div class="clearfloat"></div>
		<!--today begin -->
		<div class="today">

			<div class="today_b">
				<ul>
				
				<div style="color: red;">${errorPage }</div>
					<%-- <c:if test="${Page>=(number/15)}">
					   
				</c:if> --%>
					<c:forEach items="${books}" var="dail" begin="${15*(Page-1)}"
						end="${15*(Page-1)+14}" varStatus="statue">
						<li><a
							href="${pageContext.request.contextPath}/book/item.action?bid=${dail.bid}"
							target="_blank">
								<div class="pics">
									<img src="${dail.imgurl}" alt="" title="" width="175"
										height="224">

								</div>
								<div class="tt">${dail.name}</div>
								<div class="no_price">
									<span class="dj">定价：<del>￥${dail.price}</del></span><span
										class="yhj">优惠价<b>￥${dail.price}</b></span>
								</div>
						</a></li>

					</c:forEach>

					<c:forEach items="${ALLbooks}" var="dail" begin="${15*(Page-1)}"
						end="${15*(Page-1)+14}" varStatus="statue">
						<li><a
							href="${pageContext.request.contextPath}/book/item.action?bid=${dail.bid}"
							target="_blank">
								<div class="pics">
									<img src="${dail.imgurl}" alt="" title="" width="175"
										height="224">

								</div>
								<div class="tt">${dail.name}</div>
								<div class="no_price">
									<span class="dj">定价：<del>￥${dail.price}</del></span><span
										class="yhj">优惠价<b>￥${dail.price}</b></span>
								</div>
						</a></li>


					</c:forEach>




				</ul>
			</div>
		</div>




		<!--today end -->
		<!--page begin -->
		<div style="clear: both;"></div>
		<div class="pages">
			<a
				href="${pageContext.request.contextPath}/book/sort_best.action?ispage=1&id=${ID}&grade=${grade}&special=${special}&flag=${flag}&page=${Page-1}">&lt;&lt;上一页</a>
			<%
				int number = (int) request.getAttribute("number");
				int totlal = number / 15 + 1;
				for (int i = 0; i < number / 15 + 1; i++) {
					int j = i + 1;
					%>
					
					<a href="${pageContext.request.contextPath}/book/sort_best.action?ispage=1&id=${ID}&grade=${grade}&special=${special}&flag=${flag}&page=<%=j%>"><%=j%></a>
					<% 
				}
			%>
			
			       <a href="${pageContext.request.contextPath}/book/sort_best.action?ispage=1&id=${ID}&grade=${grade}&special=${special}&flag=${flag}&page=${Page+1}">下一页
				&gt;&gt; </a>
			<%
				out.print("共" + totlal + "页，到第"
						+ "<input name='jumpto'class='ui-page-skipTo' size='3' value='1' type='text'>页" +

						"<button type='submit' class='ui-btn-s'>确定</button>");
			%>


			<!-- <a href="#?page=2">1</a>
			<a href="#?page=2">2</a> 
			<a href="#?page=3">3</a>
			<a href="#?page=4">4</a>
			<a href="#?page=5">5</a>
			<a href="#?page=6">6</a> 
			<a href="#?page=7">7</a>...
			<a href="#?page=199">199</a>
			<a href="#?page=200">200</a> -->


		</div>
		<div style="clear: both;"></div>
		<!--page begin -->
	</div>
	<!--container end -->
	<!--footer begin -->





	<div class="footer">
		<div class="footer_t">
			<ul>
				<li><a href=""><img
						src="${pageContext.request.contextPath}/images/f1.jpg" width="130"
						height="52"></a></li>
				<li><a href=""><img
						src="${pageContext.request.contextPath}/images/f2.jpg" width="130"
						height="52"></a></li>
				<li><a href=""><img
						src="${pageContext.request.contextPath}/images/f3.jpg" width="130"
						height="52"></a></li>
				<li class="last"><a href=""><img
						src="${pageContext.request.contextPath}/images/f4.jpg" width="130"
						height="52"></a></li>
			</ul>
		</div>
		<div class="footer_b">
			<div class="footer_b1 tb1">
				<span class="f_title">购物指南</span>
				<ul>
					<li><a href="" target="_blank">购物流程</a></li>
					<li><a href="" target="_blank">发票制度</a></li>
					<li><a href="" target="_blank">账户管理</a></li>
					<li><a href="" target="_blank">会员优惠</a></li>
				</ul>
			</div>
			<div class="footer_b1 tb2">
				<span class="f_title">支付方式</span>
				<ul>
					<li><a href="" target="_blank">货到付款</a></li>
					<li><a href="" target="_blank">网上支付</a></li>
					<li><a href="" target="_blank">银行转账</a></li>
					<li><a href="" target="_blank">账户余额</a></li>
				</ul>
			</div>
			<div class="footer_b1 tb3">
				<span class="f_title">支付方式</span>
				<ul>
					<li><a href="" target="_blank">订单状态说明</a></li>
					<li><a href="" target="_blank">订单取消操作</a></li>
					<li><a href="" target="_blank">订单配送说明</a></li>
				</ul>
			</div>
			<div class="footer_b1 tb4">
				<span class="f_title">配送方式</span>
				<ul>
					<li><a href="" target="_blank">配送时间及运费</a></li>
					<li><a href="" target="_blank">验货与签收</a></li>
					<li><a href="" target="_blank">订单配送查询</a></li>
				</ul>
			</div>
			<div class="footer_b1 tb5">
				<span class="f_title">退换货</span>
				<ul>
					<li><a href="" target="_blank">退换货政策</a></li>
					<li><a href="" target="_blank">退换货流程</a></li>
					<li><a href="" target="_blank">退换货申请</a></li>
					<li><a href="" target="_blank">退款说明</a></li>
				</ul>
			</div>
			<div class="footer_b1 tb6">
				<span class="f_title">商家服务</span>
				<ul>
					<li><a href="" target="_blank">常见问题</a></li>
					<li><a href="" target="_blank">找回密码</a></li>
					<li><a href="" target="_blank">汇款单招领</a></li>
					<li><a href="" target="_blank">联系客服</a></li>
				</ul>
			</div>
		</div>
		<div class="footer_m">
			<div class="footer_nav">
				<a href="" target="_blank">关于我们</a>| <a href="" target="_blank">联系我们</a>|
				<a href="" target="_blank">人才招聘</a>| <a href="" target="_blank">广告服务</a>|
				<a href="" target="_blank">友情链接</a>| <a href="" target="_blank">销售联盟</a>|
				<a href="" target="_blank">公司简介</a>
			</div>
			<div class="footer_copyright">网络文化经营许可证鄂网文[2015]0278-060号
				Copyright © 2015-2018 版权所有</div>
		</div>

	</div>
	<!--footer end -->
</body>
</html>