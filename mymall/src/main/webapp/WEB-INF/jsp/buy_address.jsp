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
		$('#toggleManu').click(function() {
			var $addrDiv = $('#addrDiv');
			//如果隐藏
			if ($addrDiv.is(":hidden")) {
				$('#addrDiv').show();
			} else {
				$('#addrDiv').hide();
			}
		});

	});

	/* 提交新收货地址 */
	function submitAddr() {
		var form = document.getElementById("newAddrForm");
		var action = form.action;
		var idInputs = document.getElementsByName("id");
		for (var i = 0; i < idInputs.length; i++) {
			if (idInputs[i].type == "hidden") {
				action = action.concat("&id=" + idInputs[i].value);
			}
		}
		form.action = action;
		form.submit();
		return false;
	}

	/* 提交表单 */
	function submit() {
		var itemsForm = document.getElementById("itemsForm");
		var action = itemsForm.action;
		//存储收货地址id
		var sid;
		var inputs = document.getElementsByName("addrRadio");
		for (var i = 0; i < inputs.length; i++) {
			if (inputs[i].checked == true) {
				sid = inputs[i].value;
				//将收货地址id加入到action中
				url = action.concat("&sid=" + sid);
			}
		}
		var ids = document.getElementsByName("cid");
		for(var i=0;i<ids.length;i++){
			if(ids[i].type = 'hidden'){
				url = url.concat("&id="+ids[i].value);
			}
		}
		window.location.href=url;
		return false;
	}
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
		<!--1begin -->
		<div class="buy_one">

			<div class="buy_one_t">
				<div class="buy_one_t1"></div>
				<div class="buy_one_t2">商品名称</div>
				<div class="buy_one_t3">单价</div>
				<div class="buy_one_t4">数量</div>
				<div class="buy_one_t5">小计</div>
				<!-- <div class="buy_one_t6">操作</div> -->
			</div>

			<div class="buy_one_c">
				<form id="itemsForm"
					action="${pageContext.request.contextPath }/customer?method=order"
					method="post">
				   <ul>
						<c:forEach items="${pageVO.order}" var="item">
							<li>
								<div class="buy_one_c1">
									<input type="hidden" name="cid" value="${item.orderId}" />
								</div>
								<div class="buy_one_c2">
									<div class="buy_one_c2l">
										<a href=""><img src="${pageContext.request.contextPath}/images/test.jpg" width="38"
											height="54" /></a>
									</div>
									<div class="buy_one_c2r">${item.orderGoodsname }</div>
								</div>
								<div class="buy_one_c3">
									<b class="pr1"><fmt:formatNumber value="${item.orderUnitprice }"
											type="currency"></fmt:formatNumber> </b>
								</div>
								<div class="buy_one_c4">${item.orderCount }</div>
								<div class="buy_one_c5">
									<b class="pr2"><fmt:formatNumber value="${item.orderCount*item.orderUnitprice}"
											type="currency"></fmt:formatNumber> </b>
								</div> <c:set var="totalMoney" value="${item.orderCount*item.orderUnitprice+totalMoney}"></c:set>
								 <div class="buy_one_c6">
								<div class="buy_one_c62">
									<a href="">放回购物车</a>
								</div>

							</div>
							</li>
						</c:forEach>
					</ul>
				</form>
			</div>

			<div class="buy_one_b">
				<div class="address_t">收货地址</div>

				<div id="addr" class="address_x" style="height: auto;">
					 <c:forEach items="${pageVO.address}" var="addr">
						<!-- 默认的收货地址 -->
						<c:if test="${addr.defaultaddr == 1}">
							<div>
								<input name="addrRadio" type="radio" value="${addr.id}"
									checked="checked" />&nbsp;&nbsp;
								收货人:${addr.name}&nbsp;&nbsp;手机:${addr.mobile}&nbsp;&nbsp;
								收货地址:${addr.province}${addr.city}${addr.county}${addr.addrDetail}&nbsp;&nbsp;&nbsp;&nbsp;<span
									style="font-size: 10px; color: gray;">默认地址</span>
							</div>
						</c:if>
						<!-- 收货地址 -->
						<c:if test="${addr.defaultaddr == 0}">
							<div>
								<input name="addrRadio" type="radio" value="${addr.id}" />&nbsp;&nbsp;
								收货人:${addr.name}&nbsp;&nbsp;手机:${addr.mobile}&nbsp;&nbsp;
								收货地址:${addr.province}${addr.city}${addr.county}${addr.addrDetail}
							</div>
						</c:if>
					</c:forEach> 
				</div>
				<div address_t></div>
				<div class="address_x">
					<a id="toggleManu" href="javascript:void(0);" style="color: red;">添加新地址</a>
				</div>
				<div id="addrDiv" class="address_cc" style="display: none;">
					<form id="newAddrForm"
						action="insertAddress.action"
						method="post">
						 <input name="cid" value="${cid}" type="hidden" />
						  <input name="defaultaddr" value="0" type="hidden" /> 
						 
						
						<dl>
							<dt>
								<span class="red">*</span>收&nbsp;&nbsp;货&nbsp;人：
							</dt>
							<dd>
								<input name="name" type="text" class="txt1" placeholder="收货人姓名" />
							</dd>
						</dl>
						<dl>
							<dt>
								<span class="red">*</span>收货地区：
							</dt>
							<dd>
								<div>
									<select id="s_province" name="province" class="selects1"></select>  
									<select id="s_city" name="city" class="selects1"></select>   <select
										id="s_county" name="county" class="selects1"></select>
									<script class="resources library"
										src="${pageContext.request.contextPath }/js/area.js"
										"
									type="text/javascript"></script>
									<script type="text/javascript">
										_init_area();
									</script>
								</div>
								<div id="show"></div>
								<script type="text/javascript">
									var Gid = document.getElementById;
									var showArea = function() {
										Gid('show').innerHTML = "<h3>省"
												+ Gid('s_province').value
												+ " - 市" + Gid('s_city').value
												+ " - 县/区"
												+ Gid('s_county').value
												+ "</h3>"
									}
									Gid('s_county').setAttribute('onchange',
											'showArea()');
								</script>
							</dd>
						</dl>
						<dl>
							<dt>
								<span class="red">*</span>详细地址：
							</dt>
							<dd>
								<input name="addrDetail" type="text" class="txt2" />
							</dd>
						</dl>
						<dl>
							<dt>
								<span class="red">*</span>邮政编码：
							</dt>
							<dd>
								<input name="postcode" type="text" class="txt1" />
							</dd>
						</dl>
						<dl>
							<dt>
								<span class="red">*</span>手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：
							</dt>
							<dd>
								<input name="mobile" type="text" class="txt1" /> 或&nbsp; &nbsp;
								固定电话 <input name="telephone" type="text" class="txt1" />
							</dd>
						</dl>
						<dl>
							<dt></dt>
							<dd>
								<input name="address2" type="checkbox" value="1"
									class="sheding" />设为默认地址
							</dd>
						</dl>
						<!-- 提交新地址 -->
						<div>
							<a href="javascript:submitAddr();"><div class="address_qr"></div></a>
						</div>
					</form>
				</div>
			</div>

		</div>
		<!--1end -->
		<!--2begin -->
		<div class="buy_one_z">
			<p>
				商品金额：
				<fmt:formatNumber value="${totalMoney}" type="currency"></fmt:formatNumber>
			</p>
			<p>
				应付总额（含运费）：<b><fmt:formatNumber value="${totalMoney}"
						type="currency"></fmt:formatNumber></b>
			</p>
			<p>
				<!--提交整个表单 -->
				<a href="javascript:submit();" class="z_bt"></a>
			</p>
		</div>

		<!--2end -->

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