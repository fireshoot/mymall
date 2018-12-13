<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<title>首页</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css" />
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
	});
	

	
	
	//通过+-来修改数量
	function add(num,a,id) {
		num = parseInt(num);
		console.log(a.parentNode);
		var buyNum = a.parentNode.getElementsByTagName("input")[0];
		if (num == 1) {
			buyNum.value = parseInt(buyNum.value) + 1;
		} else if (num == -1) {
			buyNum.value = parseInt(buyNum.value) - 1;
		}
		if (buyNum.value < 1) {
			buyNum.value = 1;
		}
		checkSele();
		//修改后的数量
		//var count = a.nextSibling.nextSibling.value;
		//var url = "${pageContext.request.contextPath}/cart/updateCart.action?id="+id+"&buynum="+count;
		//window.location.href = url;
		var count = buyNum.value;
		
		
		
		$.ajax({ type : "post",
			url: "${pageContext.request.contextPath}/cart/updateCart.action",
			data:{"id":id,"count":count},
			dataType : "html",
			success: function(msg) {
			//$("#show").html(msg);
			}
			});
		
		
		
		
	}
	
	//加入收藏
	function collect(bookid) {
		
		
		$.ajax({ type : "post",
			url: "${pageContext.request.contextPath}/cart/collect.action",
			data:{"bookid":bookid},
			dataType : "html",
			success: function(msg) {
				if(msg=="Ok")
					alert("收藏成功！");
				else if(msg=="Failure")
					alert("收藏失败！");
				else
					alert("该商品已经收藏过了！");
			}
			});
	}
	
	//通过修改input框中的值来修改数量
	function checkNum(input,id) {
		var num = input.value;
		var regex = /^\d+$/;
		var flag = regex.test(num);
		if (!flag) {
			input.value = 1;
		}
		checkSele();
		//修改后的数量
		var count = input.value;
		//var url = "${pageContext.request.contextPath}/cart/updateCart.action?id="+id+"&buynum="+count;
		//window.location.href = url;
		$.ajax({ type : "post",
			url: "${pageContext.request.contextPath}/cart/updateCart.action",
			data:{"id":id,"count":count},
			dataType : "html",
			success: function(msg) {
			//$("#show").html(msg);
			}
			});
	}

	//确认是否删除
	function confirmDel() {
		return confirm("是否删除");
	}

	//检测选择状态
	function checkSele() {
		var seles = document.getElementsByName("sele");
		var flag = true;
		//产品总数
		var totalCount = 0;
		//产品总价
		var totalPrice = 0.00;
		for ( var i=0;i<seles.length;i++) {
			if (i != 0 && i != seles.length - 1) {
				if (seles[i].checked == false) {
					flag = false;
				}
				//拿到checkbox的父元素li,然后排除掉checkbox以外的其它元素
				if (typeof seles[i].parentNode == "object") {
					//产品单价
					var li = seles[i].parentNode.parentNode;
					var priceNode = li.childNodes.item(5);
					var price = priceNode.innerText.substr(1);
					var countNode = li.childNodes.item(7).getElementsByTagName(
							"input")[0];
					var smallCount = li.childNodes[9].childNodes[1];
					var count = countNode.value;
					//判断是否为数字
					if (!isNaN(price)) {
						price = parseFloat(price);
					}
					if (!isNaN(count)) {
						count = parseInt(count);
					}
					//动态设置小计
					smallCount.innerHTML = "￥"+(count * price).toFixed(2);
					//根据勾选内容显示购买商品的个数和总价
					if (seles[i].checked == true) {
						totalCount += count;
						totalPrice += count * price;
					} 
				}

			}
		}
		//赋值总数和总价
		var totalCountNode = document.getElementById("totalProductCount");
		var totalPriceNode = document.getElementById("totalPrice");
		totalCountNode.innerHTML = totalCount;
		totalPriceNode.innerHTML = totalPrice.toFixed(2);
		
		//判断是否全选		
		if (!flag) {
			seles[0].checked = false;
			seles[seles.length - 1].checked = false;
		} else {
			seles[0].checked = true;
			seles[seles.length - 1].checked = true;
		}
	}

	//全选全不选
	function selectAllCB(ckbox) {
		var seles = document.getElementsByName("sele");
		if (ckbox.checked == true) {
			for ( var i in seles) {
				seles[i].checked = "checked";//"checked"也可以换成true
			}
		} else {
			for ( var i in seles) {
				seles[i].checked = false;
			}
		}
		checkSele();
	}

	//批量删除
	function delBatch() {
		var url = "${pageContext.request.contextPath}/cart/cartMethod.action?method=batchDelCart";
		var seles = document.getElementsByName("sele");
		var ids="";
		var id;
		var counter=0;
		//获取选择的checkbox对应的购物车数据id拼接到url中
		for ( var i in seles) {
			if (i != 0 && i != seles.length - 1) {
				if (seles[i].checked == true) {
					var input = seles[i];
					//得到选择checkbox对应的item的id值
					id = input.nextSibling.nextSibling.value;
					//字符串拼接
					ids = ids.concat(id+",");
					counter++;
				}
			}
		}
		url=url+"&ids="+ids;
		if(counter>0){
			if (confirm("确定删除吗?")) {
				//alert(url);
				window.location.href = url;
			}
		}
	}
	
	//去发货地址选择页面
	function toBuyAddress(){
		var url = "${pageContext.request.contextPath}/cart/cartMethod.action?method=toBuyAddress";
		var seles = document.getElementsByName("sele");
		var id;
		var counter=0;
		//获取选择的checkbox对应的购物车数据id拼接到url中
		for ( var i=0;i<seles.length;i++) {
			if (i != 0 && i != seles.length - 1) {
				if (seles[i].checked == true) {
					var input = seles[i];
					//得到选择checkbox对应的item的id值
					id = input.nextSibling.nextSibling.value;
					//字符串拼接
					url = url.concat("&id=" + id);
					counter++;
				}
			}
		}
		if(counter>0){
			//alert(url);
			window.location.href = url;
		}
	}

	//切换样式
	function toggleClass(col) {
		if (col.getAttribute("style") == "color:#716d6d;") {
			col.setAttribute("style", "");
		} else {
			col.setAttribute("style", "color:#716d6d;");
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
			<a href="" target="_blank"><img src="${pageContext.request.contextPath}/images/list_banner.jpg"
				width="1100" height="92" /></a>
		</div>
		<!--1begin -->
		<div class="buy_one">

			<div class="buy_one_t">
				<div class="buy_one_t1">
					<input name="sele" type="checkbox" onclick="selectAllCB(this)"
						class="sele" />&nbsp;&nbsp;&nbsp;全选
				</div>
				<div class="buy_one_t2">商品名称</div>
				<div class="buy_one_t3">单价</div>
				<div class="buy_one_t4">数量</div>
				<div class="buy_one_t5">小计</div>
				<div class="buy_one_t6">操作</div>
			</div>

			<div class="buy_one_c">
				<form method="post" id="cartForm"
					action="${pageContext.request.contextPath }/book?method=toBuy">
					<!-- 购物车书籍展示ul -->
					<ul id="cart">
						<c:forEach items="${cartItems}" var="item">
							<li>
								<div class="buy_one_c1">
									<input name="sele" type="checkbox" value="" class="sele"
										onclick="checkSele()" /> <input type="hidden" name="id"
										value="${item.id}" />
								</div>
								<div class="buy_one_c2">
									<div class="buy_one_c2l">
										<a href= "${pageContext.request.contextPath}/book/item.action?bid=${item.id}"><img src="${item.imgurl}" width="38"
											height="54" /></a>
									</div>
									<div class="buy_one_c2r" style="text-align: center;">${item.bname }</div>
								</div>
								<div class="buy_one_c3">
									<b class="pr1"><fmt:formatNumber value="${item.unitprice}"
											type="currency"></fmt:formatNumber> </b>
								</div>
								<div class="buy_one_c4">
									<div class="wrap-input2">
										<a onclick="add(-1,this,${item.id})" href="javascript:void(0)"
											class="btn-reduce2">减少数量</a> <a
											onclick="add(1,this,${item.id})" href="javascript:void(0)"
											class="btn-add2">增加数量</a> <input
											onkeyup="checkNum(this,${item.id})" value="${item.buynum}"
											class="text2">
									</div>
								</div>
								<div class="buy_one_c5">
									<b class="pr2"><fmt:formatNumber value="${item.amount}"
											type="currency"></fmt:formatNumber> </b>
								</div>
								<div class="buy_one_c6">
									<div class="buy_one_c61">
										<a onclick="collect(${item.bid})" href="javascript:void(0);">收藏</a>
										<!-- ${pageContext.request.contextPath}/book?method=collection&id=${item.id}-->
									</div>
									<div class="buy_one_c61">
										<a onclick="return confirmDel()"
											href="${pageContext.request.contextPath}/cart/cartMethod.action?method=delCart&id=${item.id}">删除</a>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</form>
			</div>

			<div class="buy_one_b">
				<div class="buy_one_bleft">
					<div id="J_leftBar">
						<input type="checkbox" value="all" name="sele" id="J_selectAll_2"
							sign="1" onclick="selectAllCB(this)"> <span
							id="F_selectAll_2" sign="1">全选</span> <a
							href="javascript:void(0);" class="mr15" id="J_removeAllBtn"
							onclick="delBatch()">批量删除</a>
					</div>
				</div>

				<div class="buy_one_bright">
					<p>
						<span class="cartsum">总计&nbsp;&nbsp;<span
							style="color: #c30; font-size: 18px; font-weight: bold;"
							id="totalProductCount">0</span> &nbsp;&nbsp;件商品 <!-- </span> <span style="font-family: Arial; font-size: 14px;">&yen;</span> -->
							<span class="price" id="J_totalMoney"><fmt:formatNumber
									value="${item.unitPrice }" type="currency"></fmt:formatNumber>
						</span>
					</p>
					<p class="subtotal">
						<span class="cartsum">应付总额(不含运费)：</span> <span
							style="color: #C30; font-size: 18px; font-weight: bold; font-family: Arial;">&yen;</span>
						<span class="price" id="totalPrice">0.00</span>
					</p>
					<p>
						<a href="javascript:toBuyAddress();" class="ch_bt" id="ch_bt" ></a>
					</p>

				</div>
			</div>

		</div>
		<!--1end -->
		<!--hot begin -->
		<div class="buy_hot">
			<div class="buy_hot_t">热卖商品</div>
			<div class="today_b">
				<ul>
					<li><a href="">
							<div class="pics">
								<img src="${pageContext.request.contextPath}/images/book_1.jpg" width="178" height="168" alt=""
									title="" />
							</div>
							<div class="tt">世界历史大冒险（炫酷儿童历史图画书套装共15册）</div>
							<div class="no_price">
								<span class="dj">定价：<del>￥30.5</del></span><span class="yhj">优惠价<b>￥112.3</b></span>
							</div>
					</a></li>
					<li><a href="">
							<div class="pics">
								<img src="${pageContext.request.contextPath}/images/book_1.jpg" width="178" height="168" alt=""
									title="" />
							</div>
							<div class="tt">世界历史大冒险（炫酷儿童历史图画书套装共15册）</div>
							<div class="no_price">
								<span class="dj">定价：<del>￥30.5</del></span><span class="yhj">优惠价<b>￥112.3</b></span>
							</div>
					</a></li>
					<li><a href="">
							<div class="pics">
								<img src="${pageContext.request.contextPath}/images/book_1.jpg" width="178" height="168" alt=""
									title="" />
							</div>
							<div class="tt">世界历史大冒险（炫酷儿童历史图画书套装共15册）</div>
							<div class="no_price">
								<span class="dj">定价：<del>￥30.5</del></span><span class="yhj">优惠价<b>￥112.3</b></span>
							</div>
					</a></li>
					<li><a href="">
							<div class="pics">
								<img src="${pageContext.request.contextPath}/images/book_1.jpg" width="178" height="168" alt=""
									title="" />
							</div>
							<div class="tt">世界历史大冒险（炫酷儿童历史图画书套装共15册）</div>
							<div class="no_price">
								<span class="dj">定价：<del>￥30.5</del></span><span class="yhj">优惠价<b>￥112.3</b></span>
							</div>
					</a></li>
					<li class="last"><a href="">
							<div class="pics">
								<img src="${pageContext.request.contextPath}/images/book_1.jpg" width="178" height="168" alt=""
									title="" />
							</div>
							<div class="tt">世界历史大冒险（炫酷儿童历史图画书套装共15册）</div>
							<div class="no_price">
								<span class="dj">定价：<del>￥30.5</del></span><span class="yhj">优惠价<b>￥112.3</b></span>
							</div>
					</a></li>



				</ul>
			</div>
		</div>
		<!--hot end -->
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
