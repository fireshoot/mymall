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
	
	<script>
	
	function check(){
		document.getElementById("nickname");
	}
	
	</script>
</head>
<body>

	<div class="user_cont_right" style=" overflow-y:auto; overflow-x:auto; width:730px; height:900px;">


		<div class="user_lmt">
			<div class="user_lmt1">我的收货地址</div>

		</div>
		<div class="user_coment">
			<div class="user_address">
				<form
					action="${pageContext.request.contextPath}/customer/addAddress.action"
					method="post">
					<dl>
						<dt class="yellow">新增收货地址</dt>
						<dd>电话号码、手机号码选填一项，其余均为必填选项</dd>
					</dl>
					<dl>
						<dt>
							<span class="red">*</span>所在地区
						</dt>
						<dd>
							<div>
								<select id="s_province" name="province" class="selects"></select>  
								<select id="s_city" name="city" class="selects"></select>   <select
									id="s_county" name="county" class="selects"></select>
								<script class="resources library"
									src="${pageContext.request.contextPath}/js/area.js"
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
											+ Gid('s_province').value + " - 市"
											+ Gid('s_city').value + " - 县/区"
											+ Gid('s_county').value + "</h3>"
								}
								Gid('s_county').setAttribute('onchange',
										'showArea()');
							</script>
						</dd>
					</dl>
					<dl>
						<dt>
							<span class="red">*</span>详细地址
						</dt>
						<dd>
							<textarea name="addrDetail" cols="" rows="" class="address_xx"
								placeholder="不要重复填写省市区，必须大于5个字符，小于120个字符"></textarea>
						</dd>
					</dl>
					<dl>
						<dt>
							<span class="red">*</span>邮政编码
						</dt>
						<dd>
							<input name="postcode" type="text" class="youbian" />
						</dd>
					</dl>
					<dl>
						<dt>
							<span class="red">*</span>收货人姓名
						</dt>
						<dd>
							<input name="name" type="text" class="youbian" value="长度不超过25个字符"
								onfocus="if(this.value=='长度不超过25个字符'){this.value='';}"
								onblur="if(this.value==''){this.value='长度不超过25个字符';}" />
						</dd>
					</dl>
					<dl>
						<dt>手机号码</dt>
						<dd>
							<input name="mobile" type="text" class="youbian"
								value="电话号码、手机号码必须填一项"
								onfocus="if(this.value=='电话号码、手机号码必须填一项'){this.value='';}"
								onblur="if(this.value==''){this.value='电话号码、手机号码必须填一项';}" />
						</dd>
					</dl>
					<dl>
						<dt>电话号码</dt>
						<dd>
							<input name="telephone" type="text" class="p_qh" value="区号"
								onfocus="if(this.value=='区号'){this.value='';}"
								onblur="if(this.value==''){this.value='区号';}" />- <input
								name="telephone" type="text" class="p_qh" value="电话号码"
								onfocus="if(this.value=='电话号码'){this.value='';}"
								onblur="if(this.value==''){this.value='电话号码';}" />- <input
								name="telephone" type="text" class="p_qh" value="分机"
								onfocus="if(this.value=='分机'){this.value='';}"
								onblur="if(this.value==''){this.value='分机';}" />
						</dd>
					</dl>
					<dl>
						<dt></dt>
						<dd>
							<input id="defaultaddr" name="defaultaddr" type="checkbox" value=""
								class="add_mr" />设为默认收货地址
						</dd>
					</dl>
					<dl>
						<dt></dt>
						<dd>
							<input name="bc_bt" type="submit" class="bc_bt" value="保存" />
						</dd>
					</dl>
				</form>
			</div>
			<!--address list begin -->
			
			<table width="713" border="0" cellspacing="0" cellpadding="0"
				class="address_list">
				<tr class="address_list_t">
					<th width="10%">收货人</th>
					<th width="23%">所在地区</th>
					<th width="31%">详细地址</th>
					<th width="9%">邮编</th>
					<th width="14%">电话/手机</th>
					<th width="13%">操作</th>
				</tr>

				<c:forEach items="${listaddress}" var="address">
					<tr>
						<td><div align="center">${address.name}</div></td>
						<td>${address.province}${address.city}${address.county}</td>
						<td>${address.addrDetail}</td>
						<td><div align="center">${address.postcode}</div></td>
						<td><div align="center">${address.mobile}</div></td>
						<td><div align="center">
								<a href="deleteAddress.action?idkey=${address.id}">删除</a>
							</div></td>
					</tr>
				</c:forEach>
			</table>
		

			<!--address list end -->
		</div>
	</div>

</body>
</html>