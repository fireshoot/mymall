<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC>
<html>
<% String path=request.getContextPath(); %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	type="text/css" rel="stylesheet" />
<script type="text/javascript" src="<%= path%>/js/zhucecheck.js"></script> 
<script type="text/javascript" src="<%= path%>/js/area.js"></script> 
	
</head>

<body class="body_login">
	<div class="login_t">
		<div class="login_title">欢迎注册</div>
	</div>
	<div class="zhuce_c">
		<div class="zhuce_ct">
			<span class="tit">注册新用户</span> <span class="relex">以下*标注的为必填选项</span><br/>
			
			<%String msg=(String)session.getAttribute("zhuce_err"); 
			if(msg!=null) {
				out.print("<span class='relex'>"+msg+"</span>");
			}else
				out.print("<span class='relex'></span>");
			 session.removeAttribute("zhuce_err"); 
			%>
		</div>
		<div class="zhuce_cb">
			<%-- <form action="${pageContext.request.contextPath }/customer?method=regist" method="post"> --%>
			<form action="zhuce1.action" onsubmit="return checkAll()" method="post">
				<dl>
					<dt>
						<span class="red">*</span>账号：
					</dt>
					<dd>
						<input id="nickname" onblur="checkname()" name="cname" type="text" class="usernames" />
						<span id="tip_name" class="red"></span>
					</dd>
				</dl>
				<dl>
					<dt>
						<span class="red">*</span>密码：
					</dt>
					<dd>
						<input id="password" onblur="checkpsd1()" name="password" type="password" class="passwords">
						<span id="tip_password" class="red"></span>
					</dd>
				</dl>
				<dl>
					<dt>
						<span class="red">*</span>确认密码：
					</dt>
					<dd>
						<input id="password1" onblur="checkpsd2()" name="password1" type="password" class="passwords">
						<span id="tip_password1" class="red"></span>
					</dd>
				</dl>
				<dl>
					<dt>
						<span class="red">*</span>性别：
					</dt>
					<dd>
						男&nbsp;<input name="gender" style="vertical-align: middle"
							type="radio" value="1" checked="checked" />&nbsp;&nbsp;&nbsp;&nbsp;女&nbsp;<input
							style="vertical-align: middle" name="gender" type="radio"
							value="0" />
					</dd>
				</dl>

				<dl>
					<dt>
						<span class="red">*</span>EMAIL：
					</dt>
					<dd>
						<input id="email" onblur="checkemail()" name="email" type="text" class="texts">
						<span id="tip_email" class="red"></span>
					</dd>
				</dl>
				<dl>
					<dt>
						<span class="red">*</span>电话：
					</dt>
					<dd>
						<input id="phone" onblur="checkphone()" name="phone" type="text" class="texts">
						<span id="tip_phone" class="red"></span>
					</dd>
				</dl>
				<dl>
					<dt>
						<span class="red">*</span>QQ：
					</dt>
					<dd>
						<input id="qq" onblur="checkqq()" name="qq" type="text" class="texts">
						<span id="tip_qq" class="red"></span>
					</dd>
				</dl>
				<dl>
					<dt>
						<span class="red">*</span>地址：
					</dt>
					<dd>
						<input name="address" type="text" class="texts">
					</dd>
				</dl>
				<dl>
					<dt>学校：</dt>
					<dd>
						<input name="school" type="text" class="texts">
					</dd>
				</dl>
				<dl>
					<dt>出生日期：</dt>
					<dd>
						<input name="birthday" type="date" class="texts">
					</dd>
				</dl>
				<dl>
					<dt>年级：</dt>
					<dd>
						<input name="grade" type="text" class="texts">
					</dd>
				</dl>
				<dl>
					<dt>
						<span class="red">*</span>地区：
					</dt>
					<dd>
						<div>
							<select id="s_province" name="province" class="selects"></select>  
							<select id="s_city" name="city" class="selects"></select>   <select
								id="s_county" name="district" class="selects"></select>
							<!-- 地址插件 -->
							<script class="resources library" src="${pageContext.request.contextPath }/js/area.js"
								type="text/javascript"></script>
							<!-- 初始化地址插件 -->
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
							<!--Gid('s_county').setAttribute('onchange',showArea);-->
						</script>
					</dd>
				</dl>
				<dl>
					<dt>
						<span class="red">*</span>密码提示问题一：
					</dt>
					<dd>
						<select id="question1" name="question1" class="wt1">
							<option>您最崇拜的人是谁</option>
							<option>您父亲的生日是</option>
							<option>您母亲的生日是</option>
							<option>您最喜欢的地方是哪里</option>
						</select>
					</dd>
				</dl>
				<dl>
					<dt>
						<span class="red">*</span>密码问题一答案：
					</dt>
					<dd>
						<input id="answer1" value="" onblur="checkanswer1()" name="answer1" type="text" class="texts">
						<span id="tip_answer1" class="red"></span>
					</dd>
				</dl>
				<dl>
					<dt>
						<span class="red">*</span>密码提示问题二：
					</dt>
					<dd>
						<select id="question2" name="question2" class="wt1">
							<option>您最崇拜的人是谁</option>
							<option>您父亲的生日是</option>
							<option>您母亲的生日是</option>
							<option>您最喜欢的地方是哪里</option>
						</select>
					</dd>
				</dl>
				<dl>
					<dt>
						<span class="red">*</span>密码问题二答案：
					</dt>
					<dd>
						<input id="answer2" onblur="checkanswer2()" name="answer2" value="" type="text" class="texts">
					    <span id="tip_answer2" class="red"></span>
					</dd>
				</dl>
				<dl>
					<dt></dt>
					<dd>
						<input id="agreement" name="agreement" type="checkbox" value="" class="check0" />我已阅读并同意<a
							href="" class="red">《购书网用户注册协议》</a>
					</dd>
				</dl>
				<div class="zc_bt">
					<input name="zc" type="submit" class="bts" value="注册" /> <input
						name="qx" type="reset" class="bts" value="取消" />
				</div>
			</form>
			<div class="zc_lj">
				已经有账号？<a href="" target="_blank" class="yellow">立即登陆</a>
			</div>
		</div>
	</div>
	<div class="footer_m mar38">
		<div class="footer_nav">
			<a href="" target="_blank">关于我们</a>| <a href="" target="_blank">联系我们</a>|
			<a href="" target="_blank">人才招聘</a>| <a href="" target="_blank">广告服务</a>|
			<a href="" target="_blank">友情链接</a>| <a href="" target="_blank">销售联盟</a>|
			<a href="" target="_blank">公司简介</a>
		</div>
		<div class="footer_copyright">网络文化经营许可证鄂网文[2018]0278-060号
			Copyright © 2018 版权所有</div>
	</div>
</body>
</html>