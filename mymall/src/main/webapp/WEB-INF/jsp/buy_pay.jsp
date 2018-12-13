<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>购买</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	type="text/css" rel="stylesheet" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.SuperSlide.2.1.1.js"></script>
<script>
	$(function() {
		$('.nav_left').mouseover(function() {

			$('.category_ho').show();
		}).mouseout(function() {
			$('.category_ho').hide();
		});
		//防止页面后退
		history.pushState(null, null, document.URL);
		window.addEventListener('popstate', function() {
			history.pushState(null, null, document.URL);
		});
	});

	/* 支付表单的提交 */
	function submit() {
		var payForm = document.getElementById("payForm");
		var banks = document.getElementsByName("bank");
		for(var i=0;i<banks.length;i++){
			if(banks[i].checked = "checked"){
				payForm.action = payForm.action.concat("?bank="+banks[i].value);
				payForm.submit();
				return false;
			}
		}
	}
</script>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<!--container begin -->
	<div class="container">
		<form id="payForm" action="${pageContext.request.contextPath}/pay"
			method="post">
			<!--banner begin -->
			<div class="list_banner">
				<a href="" target="_blank"><img src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/images/list_banner.jpg"
					width="1100" height="92" /></a>
			</div>
			<!--1begin -->
			<div class="buy_one">

				<div class="buy_one_t">
					<div class="buy_one_t1"></div>
					<div class="buy_one_t2">商品名称</div>
					<div class="buy_one_t3">单价</div>
					<div class="buy_one_t4">数量</div>
					<div class="buy_one_t5">小计</div>
				</div>

				<div class="buy_one_c">
					<!-- 购买商品的菜单 -->
					<ul>
						<c:forEach items="${payVO.cartItems}" var="item">
							<li>
								<div class="buy_one_c1">
									<input type="hidden" name="id" value="${item.id}" />
								</div>
								<div class="buy_one_c2">
									<div class="buy_one_c2l">
										<a href=""><img src="${item.imgUrl}" width="38"
											height="54" /></a>
									</div>
									<div class="buy_one_c2r">${item.bname }</div>
								</div>
								<div class="buy_one_c3">
									<b class="pr1"><fmt:formatNumber value="${item.unitPrice}"
											type="currency"></fmt:formatNumber></b>
								</div>
								<div class="buy_one_c4">${item.buyNum}</div>
								<div class="buy_one_c5">
									<b class="pr2"><fmt:formatNumber value="${item.amount}"
											type="currency"></fmt:formatNumber></b>
									<c:set var="totalMoney" value="${totalMoney+item.amount}"></c:set>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
				<!--收货人信息beign -->
				<div class="address_xg">
					<div class="address_xg_t">收货人信息</div>
					<div class="address_xg_b">
						<!-- 收货人信息  -->
						<dl>
							<dt>收货人姓名：</dt>
							<dd>
								<input type="text" class="txta" disabled="disabled"
									value="${payVO.address.name}" />
							</dd>
						</dl>
						<dl>
							<dt>收货地区：</dt>
							<dd>
								<input type="text" class="txta" disabled="disabled"
									value="${payVO.address.province}${payVO.address.city}${payVO.address.county}${payVO.address.addr_detail}" />
							</dd>
						</dl>
						<dl>
							<dt>邮编：</dt>
							<dd>
								<input type="text" class="txta" disabled="disabled"
									value="${payVO.address.postCode}" />
							</dd>
						</dl>
						<dl>
							<dt>手机：</dt>
							<dd>
								<input type="text" class="txta" disabled="disabled"
									value="${payVO.address.mobile }" />
							</dd>
						</dl>
					</div>
				</div>
				<!--收货人信息end -->

				<!--配送方式 begin -->
				<div class="address_xg">
					<div class="address_xg_t">配送方式</div>
					<div class="address_xg_b">
						<form id="form1" name="form1" method="post" action="">
							<p>
								<label class="courier"> <input type="radio" value="单选"
									id="RadioGroup1_0" /> 自提
								</label> <label class="courier"> <input type="radio" value="单选"
									id="RadioGroup1_1" checked="checked" /> 申通快递
								</label> <label class="courier"> <input type="radio" value="单选"
									id="RadioGroup1_1" /> 圆通快递
								</label> <label class="courier"> <input type="radio" value="单选"
									id="RadioGroup1_1" /> 平邮
								</label>
							</p>
						</form>
					</div>
				</div>
				<!--配送方式 end -->
				<!-- 订单号以及总额 -->
				<div class="address_xg">
					<div class="address_xg_t">
						订单号:<input id="oid" name="orderNum" type="text"
							readonly="readonly" style="background: #f8f8f8;"
							value="${payVO.orderId}" />&nbsp;&nbsp;&nbsp;
							支付金额: ￥<input style="color: #cc3300; background: #f8f8f8;" name="totalMoney"
							readonly="readonly"
							value="0.01" />
						<!--${totalMoney}  -->
					</div>
				</div>
			</div>
			<!--1end -->
			<!--zhifu begin -->
			<div class="pay_way">
				<div class="hd">
					选择支付方式
					<ul>
						<li>淘宝支付</li>
						<li>银联支付</li>
					</ul>
				</div>
				<div class="bd">
					<!-- 淘宝支付 -->
					<ul>
						<li><label> <input type="radio" 
								value=""  /> <img src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/images/kuaijie.jpg"
								width="161" height="42" class="pcs" />
						</label></li>
						<li><label> <input type="radio"
								value="" /> <img src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/images/zfb.jpg"
								width="161" height="42" class="pcs" />
						</label></li>
					</ul>
					<!-- 银联支付 -->
					<ul>
						<!-- 中国工商银行 -->
						<li><input type="radio" name="bank" checked="checked"
								value="CCB-NET-B2C"/> <img
								src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/images/bankccb.gif" class="pcs" />
						</li>
						<!-- 中国建设银行  -->
						<li><input type="radio" name="bank"
								value="CCB-NET"/> <img
								src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/images/bankicbc.gif" class="pcs" />
						</li>
					</ul>
				</div>
			</div>
		</form>
		<script type="text/javascript">
			jQuery(".pay_way").slide({
				delayTime : 0
			});
		</script>
		<!--zhifu end -->
		<div class="next_bt">
			<a href="javascript:submit();"></a>
		</div>

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