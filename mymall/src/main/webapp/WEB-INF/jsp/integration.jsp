<%@ page language="java" import="java.util.ArrayList,com.iss.pojo.Order" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>
<body>

<div class="user_cont_right">
	<div class="user_lmt">
		<div class="user_lmt1">查询退换货记录</div>
		<div class="user_lmt2">
			<div class="user_lmt21">
				共有<b class="red">${listorder.size()*20}</b>积分
			</div>
		</div>

	</div>
	<div class="user_coment">
		<table width="713" border="0" cellspacing="0" cellpadding="0"
			class="my_dd">
			<tbody>
				<tr>
					<th height="48" colspan="4">书籍信息</th>
					<th height="48" colspan="3">我的积分</th>
				</tr>
					
				<c:forEach items="${listorder}"  begin="${(page-1)*2}" end="${(page-1)*2+1}"  var="order">
																
				<tr>
					<td width="32" height="149"
						style="border-right: none; vertical-align: text-top;"></td>
					<td width="167">
						<div class="dd_img">
							<a href="" target="_blank"><img src="${pageContext.request.contextPath}/images/user_img.jpg"
								width="132" height="121"></a>
						</div>

					</td>
					<td colspan="2" style="padding: 0 5px; text-align: left;"><b>${order.orderGoodsname}</b></td>
					<td colspan="3">20</td>
				</tr>
				</c:forEach>
				
			</tbody>
		</table>
		<!--分页开始 -->
		<div style="clear: both;"></div>
		<div class="fenyeys">
			
				<a href="">上一页</a> 
				<%int i=1; %>
				<c:forEach items="${listorder}" step="2" var="page">
				<a href="getmyintegrate.action?page=<%=i%>"><%=i++%></a> 
				</c:forEach>
				
				<a href="">下一页</a>
			
		</div>
		<div style="clear: both;"></div>
		<!--分页结束 -->

	</div>
</div>
</body>
</html>