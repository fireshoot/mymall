<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">

$(function() {
	$(".cartcart").click(function(){
		
	//	var id="${customer.cname}";
		var id = parseInt("${customer.cid}");
		if(id==null){
			alert(id);
			window.location.href="http://www.promax.xin/mymall/customer/tologin.action";
		}
		
	});
	
	$(function() {
		$('.nav_left').mouseover(function() {
			$('.category_ho').show();
		}).mouseout(function() {

			$('.category_ho').hide();
		});

	});
	
	

});

</script>

</head>
<body>
	<!--top begin -->
	<div class="header">

		<div class="header_1">
			<div class="warp">
				<div class="header_1_l">
					<c:if test="${customer.cname != null }">
						<span style="font: bold;">${customer.cname}</span>,欢迎您光临购书网！ 
				</c:if>
					<c:if test="${customer.cname == null }">
					欢迎您光临购书网！<a href="${pageContext.request.contextPath}/customer/tologin.action">请登陆</a>
						<a href="http://www.promax.xin/mymall/customer/zhuce.action">免费注册</a>
					</c:if>
				</div>
				<div class="header_1_r">
					<ul>
					<c:if test="${customer.cname == null }">
					 <%session.setAttribute("addCartNeedCid", "操作需要登录"); %>
						<li><a href="http://www.promax.xin/mymall/customer/tologin.action">我的订单</a></li>
						<li><a class="cartcart" href="http://www.promax.xin/mymall/customer/tologin.action">购物车<span class="red">0</span>件
						</a></li>
					</c:if>
					<c:if test="${customer.cname != null }">
						<li><a href="">我的订单</a></li>
						<li><a class="cartcart" href="http://www.promax.xin/mymall/cart/showCart.action?cid=${customer.cid}">购物车<span class="red">0</span>件
						</a></li>
					</c:if>	
						<li><a href="">帮助中心</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!--logo &s begin -->
		<div class="header_2">
			<div class="logo"></div>
			<div class="srarching">
				<div class="srarching_t">
				<form action="http://www.promax.xin/mymall/book/title_sort.action" method="post">
					<input name="search_txt" type="text" class="search_txt"
						value="输入你要搜索的书籍名称"
						onfocus="if(this.value=='输入你要搜索的书籍名称'){this.value='';}"
						onblur="if(this.value==''){this.value='输入你要搜索的书籍名称';}" />
					<input name="search_bt" type="submit" class="search_bt" value="搜索" />
				</form>
				</div>
				<div class="srarching_b">
					热门搜索： <a href="">外语考试</a> <a href="">中小学教辅</a> <a href="">百科全书</a>
					<a href="">辞典</a> <a href="">牛津系列</a> <a href="">汉语工具书</a> <a
						href="">英语工具书</a>
				</div>
			</div>
			<div class="ewm">
				<img src="${pageContext.request.contextPath}/images/ewm.jpg"
					width="92" height="92" />
			</div>

		</div>
		<!--logo &s end -->
		<!--nav begin -->
		<div class="nav">
			<div class="warp">
				<div class="nav_left">

					全部分类
					<div class="category_ho">
						<dl>
							<dt>
								<a href="${pageContext.request.contextPath}/book/sort.action?special=1">小学</a>
							</dt>
							<dd>
								<a href="${pageContext.request.contextPath}/book/sort.action?grade=1">小学一年级</a> 
								<a href="${pageContext.request.contextPath}/book/sort.action?grade=2">小学二年级</a>
								 <a href="${pageContext.request.contextPath}/book/sort.action?grade=3">小学三年级</a> <a
									href="${pageContext.request.contextPath}/book/sort.action?grade=4">小学四年级</a> 
									<a href="${pageContext.request.contextPath}/book/sort.action?grade=5">小学五年级</a> 
									<a href="${pageContext.request.contextPath}/book/sort.action?grade=6">小学六年级</a>
							</dd>
						</dl>
						<dl>
							<dt>
								<a href="${pageContext.request.contextPath}/book/sort.action?special=2">初中</a>
							</dt>
							<dd>
								<a href="${pageContext.request.contextPath}/book/sort.action?grade=7">初中一年级</a> 
								<a href="${pageContext.request.contextPath}/book/sort.action?grade=8">初中二年级</a>
								 <a href="${pageContext.request.contextPath}/book/sort.action?grade=9">初中三年级</a>
							</dd>
						</dl>
						<dl>
							<dt>
								<a href="${pageContext.request.contextPath}/book/sort.action?special=3">高中</a>
							</dt>
							<dd>
								<a href="${pageContext.request.contextPath}/book/sort.action?grade=10">高中一年级</a>
								 <a href="${pageContext.request.contextPath}/book/sort.action?grade=11">高中二年级</a> 
								 <a href="${pageContext.request.contextPath}/book/sort.action?grade=12">高中三年级</a>
							</dd>
						</dl>
						<dl>
							<dt>
								<a href="${pageContext.request.contextPath}/book/sort.action?special=5">教育</a>
							</dt>
							<dd>
								<a href="">教材</a> <a href="">外语考试</a> <a href="">中小学教辅</a>
							</dd>
						</dl>
						<dl>
							<dt>
								<a href="${pageContext.request.contextPath}/book/sort.action?special=6">工具书</a>
							</dt>
							<dd>
								<a href="">汉语工具书</a> <a href="">英语工具书</a> <a href="">其他语种工具</a>
								<a href="">百科全书</a> <a href="">文学鉴赏</a> <a href="">辞典</a> <a
									href="">牛津系列</a> <a href="">朗文系列种工具</a> <a href="">民族语工具书</a> <a
									href="">英文原版书</a>
							</dd>
						</dl>
						<dl class="last">
							<dt>
								<a href="${pageContext.request.contextPath}/book/sort.action?special=8">期刊</a>
							</dt>
							<dd></dd>
						</dl>
					</div>

				</div>
				<div class="nav_right">
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/book/toIndex.action">首页</a></li>
						<li><a href="">促销优惠</a></li>
						<c:if test="${customer.cname != null }">
							<li><a class="cartcart" href="http://www.promax.xin/mymall/cart/showCart.action?cid=${customer.cid}">购物车</a></li>
							<li><a href="">我的订单</a></li>
							<li><a href="${pageContext.request.contextPath}/customer/tousercenter.action">个人中心</a></li>
							<li><a href="">客户服务</a></li>
					  </c:if>	
					  <c:if test="${customer.cname == null }">
					  <%session.setAttribute("addCartNeedCid", "操作需要登录"); %>
							<li><a class="cartcart" href="http://www.promax.xin/mymall/customer/tologin.action">购物车</a></li>
							<li><a href="http://www.promax.xin/mymall/customer/tologin.action">我的订单</a></li>
							<li><a href="http://www.promax.xin/mymall/customer/tologin.action">个人中心</a></li>
							<li><a href="http://www.promax.xin/mymall/customer/tologin.action">客户服务</a></li>
					  </c:if>	
					  
						
					</ul>
				</div>
			</div>
		</div>
		<!--nav end -->
		<div class="clearfloat"></div>
	</div>
	<!--top end -->
</body>
</html>