<%@page import="com.iss.pojo.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC>
<html>
<%
	String path = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品详情</title>
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
<script>
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
			bookForm.action = "${pageContext.request.contextPath}/cart/toAddCart.action";
		} else if (arg == 2) {
			bookForm.action = "${pageContext.request.contextPath}/cart/toAddCart.action";
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
				width="1100" height="92" /></a>
		</div>
		<!--banner end -->
		<!--left begin -->
		<div class="xq_left_dq">
			<a href="" target=""> 购书网</a> &gt; <a href="" target=""> 图书</a> &gt;
			<a href="" target=""> 中小学教辅</a> &gt; 小学一年级
		</div>
		<div class="xq_left">
			<!--book begin -->
			<div class="xq_book">

				<div class="books">
					<div id="preview" class="spec-preview">
						<span class="jqzoom"><img
							style="width: 350px; height: 498px;" jqimg="${book.imgurl}"
							src="${book.imgurl}" /></span>
					</div>
					<!--缩图开始-->
					<div class="spec-scroll">
						<a class="prev"></a> <a class="next"></a>
						<div class="items">
							<ul>
								<li><img alt="" bimg="${book.imgurl}" src="${book.imgurl}"
									onmousemove="preview(this);"></li>
								<li><img alt="" bimg="${book.imgurl}" src="${book.imgurl}"
									onmousemove="preview(this);"></li>
								<li><img alt="" bimg="${book.imgurl}" src="${book.imgurl}"
									onmousemove="preview(this);"></li>
								<li><img alt="" bimg="${book.imgurl}" src="${book.imgurl}"
									onmousemove="preview(this);"></li>
								<li><img alt="" bimg="${book.imgurl}" src="${book.imgurl}"
									onmousemove="preview(this);"></li>
								<li><img alt="" bimg="${book.imgurl}" src="${book.imgurl}"
									onmousemove="preview(this);"></li>
								<li><img alt="" bimg="${book.imgurl}" src="${book.imgurl}"
									onmousemove="preview(this);"></li>
								<li><img alt="" bimg="${book.imgurl}" src="${book.imgurl}"
									onmousemove="preview(this);"></li>
								<li><img alt="" bimg="${book.imgurl}" src="${book.imgurl}"
									onmousemove="preview(this);"></li>
								<li><img alt="" bimg="${book.imgurl}" src="${book.imgurl}"
									onmousemove="preview(this);"></li>
								<li><img alt="" bimg="${book.imgurl}" src="${book.imgurl}"
									onmousemove="preview(this);"></li>
								<li><img alt="" bimg="${book.imgurl}" src="${book.imgurl}"
									onmousemove="preview(this);"></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- xinxi begin -->
				<div class="books_info">
					<form id="bookForm" name="form1" method="post" action="toAddCart.action">
						<h1>${book.name }</h1>
						
						<input name="bname" value="${book.name}" type="hidden" />
						<input name="bid" value="${book.bid}" type="hidden" />
						<input name="cid" value="${customer.cid}" type="hidden" />
						<input name="imgurl" value="${book.imgurl}" type="hidden" />
						<input name="createtime" value="${book.uploadbooktime}" type="hidden" />
						<input name="amount" value="${book.price*book.discount}" type="hidden" />
						<input name="unitprice" value="${book.price*book.discount}" type="hidden" />
						<div class="info">
							<dl>
								<dt>优&nbsp;&nbsp;惠&nbsp;&nbsp;价</dt>
								<dd>
									<b class="price_s"><fmt:formatNumber
											value="${book.price*book.discount}"  type="currency"></fmt:formatNumber>
									</b><span class="red">（${book.discount}折）</span>
								</dd>
							</dl> 	
							<dl>
								<dt>定&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价</dt>
								<dd>
									<del>
										<fmt:formatNumber value="${book.price}" type="currency"></fmt:formatNumber>
									</del>
								</dd>
							</dl>
							<dl>
								<dt>时&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;段</dt>
								<dd>

									<label> <input type="radio" name="RadioGroup1"
										value="单选" id="RadioGroup1_0" /> 单期
									</label> <label> <input type="radio" name="RadioGroup1"
										value="单选" id="RadioGroup1_1" /> 半年
									</label> <label> <input type="radio" name="RadioGroup1"
										value="单选" id="RadioGroup1_1" /> 全年
									</label>
								</dd>
							</dl>
							<dl>
								<dt>购买数量</dt>
								<dd>
									<div class="wrap-input">
										<a onclick="add(-1)" href="javascript:void(0)" class="btn-reduce">减少数量</a> 
										<a onclick="add(+1)" href="javascript:void(0)" class="btn-add">增加数量</a> 
										<input onkeyup="checkNum()" value="1" id="buy-num" name="buynum" class="text">
									</div>
								</dd>
							</dl>
							<dl>
								<dt>库&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;存</dt>
								<dd>
									<span class="red">${book.stock }</span>件
								</dd>
							</dl>
							<dl>
								<dt>运&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;费</dt>
								<dd>
									￥10.00 <a href="" target="_blank" class="red">&nbsp;&nbsp;配送说明</a>
								</dd>
							</dl>
						</div>
						<!--dapei begin -->
						<div class="dapei">
							<div class="dapei_l">搭配可选</div>
							<div class="dapei_r">
								<ul>
									<li>
										<div class="dapei_rli1">
											<a href="" target="_blank"><img
												src="${book.homeimageurl}" width="72" height="86" /></a>
										</div>
										<div class="dapei_rli2">
											<a href="" target="_blank">5全国职称英语资料</a>
										</div>
										<div class="dapei_rli3">
											<input name="checkbox1" type="checkbox" value=""
												class="check1" />￥38.04
										</div>
									</li>
									<li>
										<div class="dapei_rli1">
											<a href="" target="_blank"><img
												src="${book.homeimageurl}" width="72" height="86" /></a>
										</div>
										<div class="dapei_rli2">
											<a href="" target="_blank">5全国职称英语资料</a>
										</div>
										<div class="dapei_rli3">
											<input name="checkbox1" type="checkbox" value=""
												class="check1" />￥38.04
										</div>
									</li>
									<li>
										<div class="dapei_rli1">
											<a href="" target="_blank"><img
												src="${book.homeimageurl}" width="72" height="86" /></a>
										</div>
										<div class="dapei_rli2">
											<a href="" target="_blank">5全国职称英语资料</a>
										</div>
										<div class="dapei_rli3">
											<input name="checkbox1" type="checkbox" value=""
												class="check1" />￥38.04
										</div>
									</li>
								</ul>
							</div>
						</div>
						<!--dapei end -->
						<div class="book_but">
							<div class="book_but1">
								<a href="javascript:submit(1);">立即购买</a>
							</div>
							<div class="book_but2">
								<a href="javascript:submit(2);"><i></i>加入购物车</a>
							</div>
						</div>

						<!-- xinxi end -->
					</form>
				</div>
				<!--book end -->
				<!--book 详情 begin -->

				<!--pinglun end -->
			</div>
			<!--left end -->
			<div class="book_xq">
				<div class="book_xq_t">商品详情</div>
				<div class="book_xq_b">${book.detail }</div>
			</div>
			<!--book 详情 end -->
			<!--pinglun begin -->
			<div class="evaluate">

				<div class="evaluate_2">
					<span class="more"><a href="">查看全部评论>></a></span>
					
					<ul class="tabbtn_3" id="normaltab_3">
						<li class="current"><a href="">全部(${comment.size()})</a></li>
						<li><a href="">好评(${comment.size()})</a></li>
						<li><a href="">中评(0)</a></li>
						<li><a href="">差评(0)</a></li>
						<li><a href="">追评(0)</a></li>
						
					</ul>
					
					<div class="tabcon_3" id="normalcon_3">
                            <div class="sublist_3" style="display: block;">
                                  <ul style="padding-bottom:20px;">
                                  
                                  <c:forEach items="${comment}" var="dail" varStatus="statue">
                                   <li>
                                         <div class="people_pic">
                                           		<c:if test="${dail.cidimagesurl==null }">
                                           			<img src="http://www.promax.xin/mymall/images/xq_pep.jpg">
                                           		</c:if>
                                                <c:if test="${dail.cidimagesurl!=null }">
                                           			<img src="${dail.cidimagesurl}">
                                           		 </c:if>
                                               
                                               <p>${dail.bookname}</p>
                                           </div>
                                           <div class="pl_txt">
                                                <div class="pl_txt_1"><img src="http://www.promax.xin/mymall/images/star5.jpg" width="68" height="13"></div>
                                                <div class="pl_txt_2">
                                                     <p>心得：<b>${dail.content}</b></p>
                                                     <p style="text-indent:3em;">2014-2-15 &nbsp;10:12:10</p>
                                                     <p style="text-indent:3em;">购买日期：2014-2-10 &nbsp;11:10:10</p>
                                                </div>
                                              
                                           </div>
                                      </li>
                                      
                             
                                  
                                  </c:forEach>
                                  
                                  
                                     
                               
                               
                               
                               
                                  </ul>
                            </div><!--tabcon end-->
                            <div class="sublist_3" style="display: none;">
                                
                                       <ul style="padding-bottom:20px;">
                                      <li>
                                           <div class="people_pic">
                                               <img src="http://www.promax.xin/mymall/images/xq_pep.jpg">
                                               <p>sfdsas我的世界g</p>
                                           </div>
                                           <div class="pl_txt">
                                                <div class="pl_txt_1"><img src="http://www.promax.xin/mymall/images/star5.jpg" width="68" height="13"></div>
                                                <div class="pl_txt_2">
                                                     <p>心得：<b>很喜欢，很实用,以后就这家了</b></p>
                                                     <p style="text-indent:3em;">2014-2-15 &nbsp;10:12:10</p>
                                                     <p style="text-indent:3em;">购买日期：2014-2-10 &nbsp;11:10:10</p>
                                                    
                                                </div>
                                                
                                           </div>
                                      </li>
                                      <li>
                                           <div class="people_pic">
                                               <img src="http://www.promax.xin/mymall/images/xq_pep.jpg">
                                               <p>sfdsas我的世界g</p>
                                           </div>
                                           <div class="pl_txt">
                                                <div class="pl_txt_1"><img src="http://www.promax.xin/mymall/images/star5.jpg" width="68" height="13"></div>
                                                <div class="pl_txt_2">
                                                     <p>心得：<b>很喜欢，很实用,以后就这家了</b></p>
                                                     <p style="text-indent:3em;">2014-2-15 &nbsp;10:12:10</p>
                                                     <p style="text-indent:3em;">购买日期：2014-2-10 &nbsp;11:10:10</p>
                                                    
                                                </div>
                                                
                                           </div>
                                      </li>
                                      <li>
                                           <div class="people_pic">
                                               <img src="http://www.promax.xin/mymall/images/xq_pep.jpg">
                                               <p>sfdsas我的世界g</p>
                                           </div>
                                           <div class="pl_txt">
                                                <div class="pl_txt_1"><img src="http://www.promax.xin/mymall/images/star5.jpg" width="68" height="13"></div>
                                                <div class="pl_txt_2">
                                                     <p>心得：<b>很喜欢，很实用,以后就这家了</b></p>
                                                     <p style="text-indent:3em;">2014-2-15 &nbsp;10:12:10</p>
                                                     <p style="text-indent:3em;">购买日期：2014-2-10 &nbsp;11:10:10</p>
                                                    
                                                </div>
                                                
                                           </div>
                                      </li>
                                      <li>
                                           <div class="people_pic">
                                               <img src="http://www.promax.xin/mymall/images/xq_pep.jpg">
                                               <p>sfdsas我的世界g</p>
                                           </div>
                                           <div class="pl_txt">
                                                <div class="pl_txt_1"><img src="http://www.promax.xin/mymall/images/star5.jpg" width="68" height="13"></div>
                                                <div class="pl_txt_2">
                                                     <p>心得：<b>很喜欢，很实用,以后就这家了</b></p>
                                                     <p style="text-indent:3em;">2014-2-15 &nbsp;10:12:10</p>
                                                     <p style="text-indent:3em;">购买日期：2014-2-10 &nbsp;11:10:10</p>
                                                     
                                                </div>
                                                
                                           </div>
                                      </li>
                                  </ul>

                            </div><!--tabcon end-->
                            <div class="sublist_3" style="display: none;">
                                
                                      <ul style="padding-bottom:20px;">
                                      <li>
                                           <div class="people_pic">
                                               <img src="http://www.promax.xin/mymall/images/xq_pep.jpg">
                                               <p>sfdsas我的世界g</p>
                                           </div>
                                           <div class="pl_txt">
                                                <div class="pl_txt_1"><img src="http://www.promax.xin/mymall/images/star5.jpg" width="68" height="13"></div>
                                                <div class="pl_txt_2">
                                                     <p>心得：<b>很喜欢，很实用,以后就这家了</b></p>
                                                     <p style="text-indent:3em;">2014-2-15 &nbsp;10:12:10</p>
                                                     <p style="text-indent:3em;">购买日期：2014-2-10 &nbsp;11:10:10</p>
                                                     
                                                </div>
                                                
                                           </div>
                                      </li>
                                      <li>
                                           <div class="people_pic">
                                               <img src="http://www.promax.xin/mymall/images/xq_pep.jpg">
                                               <p>sfdsas我的世界g</p>
                                           </div>
                                           <div class="pl_txt">
                                                <div class="pl_txt_1"><img src="http://www.promax.xin/mymall/images/star5.jpg" width="68" height="13"></div>
                                                <div class="pl_txt_2">
                                                     <p>心得：<b>很喜欢，很实用,以后就这家了</b></p>
                                                     <p style="text-indent:3em;">2014-2-15 &nbsp;10:12:10</p>
                                                     <p style="text-indent:3em;">购买日期：2014-2-10 &nbsp;11:10:10</p>
                                                     
                                                </div>
                                                
                                           </div>
                                      </li>
                                      <li>
                                           <div class="people_pic">
                                               <img src="http://www.promax.xin/mymall/images/xq_pep.jpg">
                                               <p>sfdsas我的世界g</p>
                                           </div>
                                           <div class="pl_txt">
                                                <div class="pl_txt_1"><img src="http://www.promax.xin/mymall/images/star5.jpg" width="68" height="13"></div>
                                                <div class="pl_txt_2">
                                                     <p>心得：<b>很喜欢，很实用,以后就这家了</b></p>
                                                     <p style="text-indent:3em;">2014-2-15 &nbsp;10:12:10</p>
                                                     <p style="text-indent:3em;">购买日期：2014-2-10 &nbsp;11:10:10</p>
                                                    
                                                </div>
                                                
                                           </div>
                                      </li>
                                      <li>
                                           <div class="people_pic">
                                               <img src="http://www.promax.xin/mymall/images/xq_pep.jpg">
                                               <p>sfdsas我的世界g</p>
                                           </div>
                                           <div class="pl_txt">
                                                <div class="pl_txt_1"><img src="http://www.promax.xin/mymall/images/star5.jpg" width="68" height="13"></div>
                                                <div class="pl_txt_2">
                                                     <p>心得：<b>很喜欢，很实用,以后就这家了</b></p>
                                                     <p style="text-indent:3em;">2014-2-15 &nbsp;10:12:10</p>
                                                     <p style="text-indent:3em;">购买日期：2014-2-10 &nbsp;11:10:10</p>
                                                   
                                                </div>
                                                
                                           </div>
                                      </li>
                                  </ul>

                            </div><!--tabcon end-->
                            <div class="sublist_3" style="display: none;">
                                
                                      <ul style="padding-bottom:20px;">
                                      <li>
                                           <div class="people_pic">
                                               <img src="http://www.promax.xin/mymall/images/xq_pep.jpg">
                                               <p>sfdsas我的世界g</p>
                                           </div>
                                           <div class="pl_txt">
                                                <div class="pl_txt_1"><img src="http://www.promax.xin/mymall/images/star5.jpg" width="68" height="13"></div>
                                                <div class="pl_txt_2">
                                                     <p>心得：<b>很喜欢，很实用,以后就这家了</b></p>
                                                     <p style="text-indent:3em;">2014-2-15 &nbsp;10:12:10</p>
                                                     <p style="text-indent:3em;">购买日期：2014-2-10 &nbsp;11:10:10</p>
                                                    
                                                </div>
                                                
                                           </div>
                                      </li>
                                      <li>
                                           <div class="people_pic">
                                               <img src="http://www.promax.xin/mymall/images/xq_pep.jpg">
                                               <p>sfdsas我的世界g</p>
                                           </div>
                                           <div class="pl_txt">
                                                <div class="pl_txt_1"><img src="http://www.promax.xin/mymall/images/star5.jpg" width="68" height="13"></div>
                                                <div class="pl_txt_2">
                                                     <p>心得：<b>很喜欢，很实用,以后就这家了</b></p>
                                                     <p style="text-indent:3em;">2014-2-15 &nbsp;10:12:10</p>
                                                     <p style="text-indent:3em;">购买日期：2014-2-10 &nbsp;11:10:10</p>
                                                   
                                                </div>
                                                
                                           </div>
                                      </li>
                                      <li>
                                           <div class="people_pic">
                                               <img src="http://www.promax.xin/mymall/images/xq_pep.jpg">
                                               <p>sfdsas我的世界g</p>
                                           </div>
                                           <div class="pl_txt">
                                                <div class="pl_txt_1"><img src="http://www.promax.xin/mymall/images/star5.jpg" width="68" height="13"></div>
                                                <div class="pl_txt_2">
                                                     <p>心得：<b>很喜欢，很实用,以后就这家了</b></p>
                                                     <p style="text-indent:3em;">2014-2-15 &nbsp;10:12:10</p>
                                                     <p style="text-indent:3em;">购买日期：2014-2-10 &nbsp;11:10:10</p>
                                                     
                                                </div>
                                                
                                           </div>
                                      </li>
                                      <li>
                                           <div class="people_pic">
                                               <img src="http://www.promax.xin/mymall/images/xq_pep.jpg">
                                               <p>sfdsas我的世界g</p>
                                           </div>
                                           <div class="pl_txt">
                                                <div class="pl_txt_1"><img src="http://www.promax.xin/mymall/images/star5.jpg" width="68" height="13"></div>
                                                <div class="pl_txt_2">
                                                     <p>心得：<b>很喜欢，很实用,以后就这家了</b></p>
                                                     <p style="text-indent:3em;">2014-2-15 &nbsp;10:12:10</p>
                                                     <p style="text-indent:3em;">购买日期：2014-2-10 &nbsp;11:10:10</p>
                                                     
                                                </div>
                                                
                                           </div>
                                      </li>
                                  </ul>

                            </div><!--tabcon end-->
                            <div class="sublist_3" style="display: none;">
                                
                                       <ul style="padding-bottom:20px;">
                                      <li>
                                           <div class="people_pic">
                                               <img src="http://www.promax.xin/mymall/images/xq_pep.jpg">
                                               <p>sfdsas我的世界g</p>
                                           </div>
                                           <div class="pl_txt">
                                                <div class="pl_txt_1"><img src="http://www.promax.xin/mymall/images/star5.jpg" width="68" height="13"></div>
                                                <div class="pl_txt_2">
                                                     <p>心得：<b>很喜欢，很实用,以后就这家了</b></p>
                                                     <p style="text-indent:3em;">2014-2-15 &nbsp;10:12:10</p>
                                                     <p style="text-indent:3em;">购买日期：2014-2-10 &nbsp;11:10:10</p>
                                                     
                                                </div>
                                                
                                           </div>
                                      </li>
                                     
                                  </ul>

                            </div><!--tabcon end-->
                            
                        </div>
					
					<!--tabbtn end-->
					<div class="tabcon_3" id="normalcon_3">
						<div class="sublist_3">
							<ul style="padding-bottom: 20px;">
								<c:forEach items="${pageVo.comments}" var="comment">
									<li>
										<div class="people_pic">
											<img src="${comment.customer.picurl}">
											<p>${comment.customer.nickname}</p>
										</div>
										<div class="pl_txt">
											<div class="pl_txt_1">
												<c:choose>
													<c:when test="${comment.satisDegree==5}">
														<img
															src="${pageContext.request.contextPath}/images/star5.jpg"
															width="68" height="13" />
													</c:when>
													<c:when test="${comment.satisDegree==4}">
														<img
															src="${pageContext.request.contextPath}/images/star4.png"
															width="68" height="13" />
													</c:when>
													<c:when test="${comment.satisDegree==3}">
														<img
															src="${pageContext.request.contextPath}/images/star3.png"
															width="68" height="13" />
													</c:when>
													<c:when test="${comment.satisDegree==2}">
														<img
															src="${pageContext.request.contextPath}/images/star2.png"
															width="68" height="13" />
													</c:when>
													<c:when test="${comment.satisDegree==1}">
														<img
															src="${pageContext.request.contextPath}/images/star1.png"
															width="68" height="13" />
													</c:when>
													<c:when test="${comment.satisDegree==0}">
														<img
															src="${pageContext.request.contextPath}/images/star0.png"
															width="68" height="13" />
													</c:when>
												</c:choose>
											</div>
											<div class="pl_txt_2">
												<p>
													心得：<b>${comment.content }</b>
												</p>
												<p style="text-indent: 3em;">${comment.commentTime}</p>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
						<!--tabcon end-->
					</div>
					<!--tabbox end-->
				</div>
				<script type="text/javascript"
					src="${pageContext.request.contextPath}/js/jquery.tabso_yeso.js"></script>
				<script type="text/javascript">
						$(document).ready(function($) {

							//默认选项卡切换
							$("#normaltab_3").tabso({
								cntSelect : "#normalcon_3",
								tabEvent : "mouseover",
								tabStyle : "normal"
							});

						});
					</script>
			</div>

		

		</div>
		<!--container end -->
		<!--footer begin -->
		<div class="footer">
			<div class="footer_t">
				<ul>
					<li><a href=""><img
							src="${pageContext.request.contextPath}/images/f1.jpg"
							width="130" height="52" /></a></li>
					<li><a href=""><img
							src="${pageContext.request.contextPath}/images/f2.jpg"
							width="130" height="52" /></a></li>
					<li><a href=""><img
							src="${pageContext.request.contextPath}/images/f3.jpg"
							width="130" height="52" /></a></li>
					<li class="last"><a href=""><img
							src="${pageContext.request.contextPath}/images/f4.jpg"
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
				<div class="footer_copyright">网络文化经营许可证鄂网文[2018]0278-060号
					Copyright © 2018 版权所有</div>
			</div>

		</div>
	</div>
	<!--footer end -->

</body>
</html>