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
			<div class="user_lmt1">我的消息</div>

		</div>
		<div class="user_coment">
			<table width="713" border="0" cellspacing="0" cellpadding="0"
				class="my_dd">
				<tr>
					<th height="48" colspan="2">状态</th>
					<th colspan="2">标题</th>
					<th width="98">发件人</th>
					<th width="117">时间</th>
					<th width="115">操作</th>
				</tr>

				<c:forEach items="${listmessage}"  begin="${(page-1)*2}" end="${(page-1)*2+1}"  var="mymessage">

				<tr>
					<td height="38" colspan="2"><input type="checkbox"
						name="dd_book" id="dd_book" class="dd_book" /> <c:if
							test="${mymessage.msgState=='0'}">未读</c:if> <c:if
							test="${mymessage.msgState=='1'}">已读</c:if></td>
					<td colspan="2">${mymessage.msgTitle}</td>
					<td>系统信息</td>
					<td><fmt:formatDate value="${mymessage.msgTime}" pattern="yyyy-MM-dd HH:mm"/></td>
					<td><a
						href="showmymessage.action?content=${mymessage.msgContent}&time=${mymessage.msgTime}&id=${mymessage.msgId}"
						style="padding-right: 6px;">查看</a> <a
						href="deletemymessage.action?id=${mymessage.msgTitle}">删除</a></td>
				</tr>
				</c:forEach>

			</table>
			<!--分页开始 -->
			<div style="clear: both;"></div>
			<div class="fenyeys">
				<a href="">上一页</a> 
				<%int i=1; %>
				<c:forEach items="${listmessage}" step="2" var="page">
				<a href="getmymessage.action?page=<%=i%>"><%=i++%></a> 
				</c:forEach>
				
				<a href="">下一页</a>
			</div>
			<div style="clear: both;"></div>
			<!--分页结束 -->

		</div>

	</div>
</body>
</html>