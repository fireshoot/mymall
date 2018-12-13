<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品列表</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script>
	$(function() {
		$('.nav_left').mouseover(function() {

			$('.category_ho').show();
		}).mouseout(function() {
			$('.category_ho').hide();
		});
	});
</script>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<!--container begin -->
	<div class="container">
		<!--banner begin -->
		<div class="list_banner">
			<a href="" target="_blank"><img src="${pageContext.request.contextPath}/images/list_banner.jpg"
				width="1100" height="92" /></a>
		</div>
		<!--banner end -->
		<%-- <div class="list_dq">
			<a href="" target="_blank">慧慧购书网</a> > <c:if test="${book.grade == 1}"><a href="${pageContext.request.contextPath}/book?method=findByBookField&currentPage=1&specialty=1" target="_self">小学</a> >小学一年级</c:if>
		</div> --%>
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
		<!-- 判断是根据specialty或者grade来查询书籍 -->
		<c:if test="${not empty book.specialty}">
			<c:set var="condition" value="specialty=${book.specialty}"></c:set>
		</c:if>
		<c:if test="${not empty book.grade}">
			<c:set var="condition" value="grade=${book.grade}"></c:set>
		</c:if>
		<c:if test="${not empty book.sold}">
			<c:set var="condition2" value="sold=${book.sold}"></c:set>
		</c:if>
		<c:if test="${not empty book.price}">
			<c:set var="condition2" value="price=${book.price}"></c:set>
		</c:if>
		<c:if test="${not empty book.pubdate}">
			<c:set var="condition2" value="pubdate=${book.pubdate}"></c:set>
		</c:if>
		<c:if test="${not empty book.name}">
			<c:set var="condition2" value="${condition2}&name=${book.name}"></c:set>
		</c:if>
		<!--paixu begin -->
		<div class="paixu">
			<div class="number">
				共有<span class="red">${page.total }</span>个商品
			</div>
			<ul>
				<li class="li1">排序</li>
				<li id="a_default"><a>默认排序</a></li>
				<li id="a_sold"><a
					href="${pageContext.request.contextPath}/book?method=findByBookField&currentPage=1&sold=1&${condition}">销量<b><img
							src="${pageContext.request.contextPath}/images/list_jtx.jpg" width="7" height="8" /></b></a></li>
				<li id="a_price"><a
					href="${pageContext.request.contextPath}/book?method=findByBookField&currentPage=1&price=1&${condition}">价格<b><img
							src="${pageContext.request.contextPath}/images/list_jts.jpg" width="7" height="8" /></b></a></li>
				<li id="a_pubdate"><a
					href="${pageContext.request.contextPath}/book?method=findByBookField&currentPage=1&pubdate=1&${condition}">出版时间<b><img
							src="${pageContext.request.contextPath}/images/list_jtx.jpg" width="7" height="8" /></b></a></li>
			</ul>
			<!-- 排序的选中状态 -->
			<script type="text/javascript">
				if ("${book.sold}".trim().length > 0) {
					document.getElementById("a_sold").setAttribute("class",
							"active");
				} else if ("${book.price}".trim().length > 0) {
					document.getElementById("a_price").setAttribute("class",
							"active");
				} else if ("${book.pubdate}".trim().length > 0) {
					document.getElementById("a_pubdate").setAttribute("class",
							"active");
				} else {
					document.getElementById("a_default").setAttribute("class",
							"active");
				}
			</script>
		</div>
		<!--paixu end -->
		<div class="clearfloat"></div>
		<!--today begin -->
		<div class="today">

			<div class="today_b">
				<!-- 商品列表开始 -->
				<ul>
					<c:forEach items="${page.rows}" var="book">
						<li><a href="">
								<div class="pics">
									<img src="${book.imgurl }" width="178" height="168" alt=""
										title="" />
								</div>
								<div class="tt">${book.name }</div>
								<div class="no_price">
									<span class="dj">定价：<del>
											<fmt:formatNumber value="${book.price}" type="currency" />
										</del></span><span class="yhj">优惠价<b><fmt:formatNumber
												value="${book.price * book.discount }" type="currency" /></b></span>
								</div>
						</a></li>
					</c:forEach>
				</ul>
			</div>
			<!-- 商品列表结束 -->
		</div>
		<!--today end -->
		<!--page begin -->
		<div style="clear: both;"></div>
		<div class="pages">
			第${page.currentPage}页/共${page.totalPages}页&nbsp;&nbsp;&nbsp;&nbsp; <a
				href="${pageContext.request.contextPath}/book?method=findByBookField&currentPage=1&${condition}&${condition2}">首页</a>&nbsp;&nbsp;
			<c:if test="${page.currentPage>1}">
				<a
					href="${pageContext.request.contextPath}/book?method=findByBookField&${condition}&currentPage=${page.currentPage-1}&${condition2}">上一页</a>&nbsp;&nbsp;
		 </c:if>
			<%-- 中间的页数 --%>
			<c:choose>
				<c:when test="${page.totalPages<=10}">
					<%--相当于switch --%>
					<%--设置变量的值 --%>
					<c:set var="beginIndex" value="1" scope="page"></c:set>
					<c:set var="endIndex" value="${page.totalPages}" scope="page"></c:set>
				</c:when>
				<c:otherwise>
					<%--相当于switch --%>
					<c:set var="beginIndex" value="${page.currentPage-5}"></c:set>
					<c:set var="endIndex" value="${page.currentPage+4}" scope="page"></c:set>
					<c:if test="${beginIndex<1}">
						<c:set var="beginIndex" value="1"></c:set>
						<c:set var="endIndex" value="10"></c:set>
					</c:if>
					<c:if test="${endIndex>page.totalPages}">
						<c:set var="beginIndex" value="${page.totalPages-9}"></c:set>
						<c:set var="endIndex" value="${page.totalPages}"></c:set>
					</c:if>
				</c:otherwise>
			</c:choose>
			<%--遍历输出 --%>
			<c:forEach var="index" begin="${beginIndex}" end="${endIndex}">
				<c:choose>
					<c:when test="${index eq page.currentPage}">
						<span class="current">${index}</span>
					</c:when>
					<c:otherwise>
						<a
							href="${pageContext.request.contextPath}/book?method=findByBookField&${condition}&currentPage=${index}&${condition2}">${index}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:if test="${page.currentPage<page.totalPages}">
				<a
					href="${pageContext.request.contextPath}/book?method=findByBookField&${condition}&currentPage=${page.currentPage+1}&${condition2}">下一页</a>&nbsp;&nbsp;
		 </c:if>
			<a
				href="${pageContext.request.contextPath}/book?method=findByBookField&${condition}&currentPage=${page.totalPages}&${condition2}">尾页</a>&nbsp;&nbsp;
			/&nbsp;&nbsp;共${page.total}条记录
			<!-- <span class="disabled">&lt;&lt;上一页</span> <span class="current">1</span>
			<a href="#?page=2">2</a> <a href="#?page=3">3</a> <a href="#?page=4">4</a>
			<a href="#?page=5">5</a> <a href="#?page=6">6</a> <a href="#?page=7">7</a>...
			<a href="#?page=199">199</a> <a href="#?page=200">200</a> <a
				href="#?page=2">下一页 &gt;&gt; </a> 共100页，到第<input type="text"
				name="jumpto" class="ui-page-skipTo" size="3" value="1">页
			<button type="submit" class="ui-btn-s">确定</button> -->
		</div>
		<div style="clear: both;"></div>
		<!--page begin -->
	</div>
	<!--container end -->
	<!--footer begin -->
	<div class="footer">
		<div class="footer_t">
			<ul>
				<li><a href=""><img src="${pageContext.request.contextPath}/images/f1.jpg" width="130"
						height="52" /></a></li>
				<li><a href=""><img src="${pageContext.request.contextPath}/images/f2.jpg" width="130"
						height="52" /></a></li>
				<li><a href=""><img src="${pageContext.request.contextPath}/images/f3.jpg" width="130"
						height="52" /></a></li>
				<li class="last"><a href=""><img src="${pageContext.request.contextPath}/images/f4.jpg"
						width="130" height="52" /></a></li>
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