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

<link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" />
<script src="${pageContext.request.contextPath}/js/moment-with-locales.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script>	
	
<script>
	
$(function() {
	var picker1 = $('#birthday').datetimepicker({
		format : 'YYYY-MM-DD',
		locale : moment.locale('zh-cn'),
	 
	});
	});
	
	function check(){
		document.getElementById("nickname");
	}
	
</script>
</head>
<body>

	<div class="user_cont_right"
		style="overflow-y: auto; overflow-x: auto; width: 730px; height: 570px;">


		<div class="user_lmt">
			<div class="user_lmt1">个人档案</div>

		</div>
		<div class="user_coment">
			<form
				action="${pageContext.request.contextPath}/customer/updatepersondata.action"
				method="post" enctype="multipart/form-data">
				<div class="gr_wap">
					<p class="gr_ts">
						亲爱的&nbsp;<b>${customer.cname }</b>，请填写真实的资料
					</p>
					<dl>
						<dt>当前头像：</dt>
						<dd>
							<div class="pic_head">
								<img src="http://www.promax.xin/pic/${customer.picurl }" width="88" height="87" />
							</div>
							<div class="pic_choice">
								<p class="pic_choice1">
									请从您的电脑中上传图片作为头像： <span class="gray">(建议尺寸96*96像素，300k以内)</span>
								</p>
								<p class="browse_mypic">
									<input type="file" name="picurl_" id="Myfile"
										style="height: 21px; width: 290px; font-size: 12px; padding-top: 3px; float: left;" />
								</p>
							</div>

						</dd>
					</dl>
					<dl>
						<dt>
							<span class="red">*</span>昵称：
						</dt>
						<dd>
							<input name="nickname" type="text" value="${customer.nickname}" class="nicheng" /></dd>
					</dl>
					<dl>
						<dt>
							<span class="red">*</span>身份：
						</dt>
						<dd>
						<c:if test="${customer.ctype=='在校学生'}">
							<label> <input type="radio" checked="checked" name="ctype"
								value="在校学生" id="RadioGroup1_0" /> 在校学生
							</label> <label> <input type="radio" name="ctype"
								value="教师" id="RadioGroup1_1" /> 教师
							</label> <label> <input type="radio" name="ctype"
								value="上班族" id="RadioGroup1_2" /> 上班族
							</label> <label> <input type="radio" name="ctype"
								value="自由职业" id="RadioGroup1_3" /> 自由职业
							</label>
						</c:if>
						<c:if test="${customer.ctype=='教师'}">
							<label> <input type="radio" name="ctype"
								value="在校学生" id="RadioGroup1_0" /> 在校学生
							</label> <label> <input type="radio" checked="checked" name="ctype"
								value="教师" id="RadioGroup1_1" /> 教师
							</label> <label> <input type="radio" name="ctype"
								value="上班族" id="RadioGroup1_2" /> 上班族
							</label> <label> <input type="radio" name="ctype"
								value="自由职业" id="RadioGroup1_3" /> 自由职业
							</label>
						</c:if>
						<c:if test="${customer.ctype=='上班族'}">
							<label> <input type="radio" name="ctype"
								value="在校学生" id="RadioGroup1_0" /> 在校学生
							</label> <label> <input type="radio" name="ctype"
								value="教师" id="RadioGroup1_1" /> 教师
							</label> <label> <input type="radio" checked="checked" name="ctype"
								value="上班族" id="RadioGroup1_2" /> 上班族
							</label> <label> <input type="radio" name="ctype"
								value="自由职业" id="RadioGroup1_3" /> 自由职业
							</label>
						</c:if>
						<c:if test="${customer.ctype=='自由职业'}">
							<label> <input type="radio"  name="ctype"
								value="在校学生" id="RadioGroup1_0" /> 在校学生
							</label> <label> <input type="radio" name="ctype"
								value="教师" id="RadioGroup1_1" /> 教师
							</label> <label> <input type="radio" name="ctype"
								value="上班族" id="RadioGroup1_2" /> 上班族
							</label> <label> <input type="radio" name="ctype"
								value="自由职业" id="RadioGroup1_3" checked="checked" /> 自由职业
							</label>
						</c:if>
						
						
						</dd>
					</dl>
					<dl>
						<dt>
							<span class="red">*</span>真实姓名：
						</dt>
						<dd>
							<input name="cname" value="${customer.cname}" type="text"
								class="realname" />
						</dd>
					</dl>
					<dl>
						<dt>性别：</dt>
						<dd>
						
							<c:if test="${customer.gender=='0'}">
							<label> <input type="radio" name="gender" checked="checked" value="0"
								id="RadioGroup2_0" /> 男
							</label> <label> <input type="radio" name="gender" value="1"
								id="RadioGroup2_1" /> 女
							</label>
							</c:if>
							
							<c:if test="${customer.gender=='1'}">
							<label> <input type="radio" name="gender"  value="0"
								id="RadioGroup2_0" /> 男
							</label> <label> <input type="radio" checked="checked" name="gender" value="1"
								id="RadioGroup2_1" /> 女
							</label>
							</c:if>
							
						</dd>
					</dl>
					<dl>
						<dt>EMAIL：</dt>
						<dd>
							<input name="email" type="text" value="${customer.email}"
								class="realname" />
						</dd>
					</dl>
					<dl>
						<dt>
							<span class="red">*</span>电话：
						</dt>
						<dd>
							<input name="phone" type="text" value="${customer.phone}"
								class="realname" />
						</dd>
					</dl>
					<dl>
						<dt>QQ：</dt>
						<dd>
							<input name="qq" type="text" value="${customer.qq}"
								class="realname" />
						</dd>
					</dl>
					<dl>
						<dt>学校：</dt>
						<dd>
							<input name="school" type="text" value="${customer.school}"
								class="realname" />
						</dd>
					</dl>
					<dl>
						<dt>班级：</dt>
						<dd>
							<input name="class_" type="text" value="${customer.class_}"
								class="realname" />
						</dd>
					</dl>
					<dl>
						<dt>生日：</dt>
						<dd>
						<input name="birthday" border="2" id="birthday" value="${customer.birthday}">
						</dd>
					</dl>
					<dl>
						<dt>
							<span class="red">*</span>居住地：
						</dt>
						<dd>
							<div>
							
								<select id="s_province" name="province"  class="selects">
								</select>  
								<select id="s_city" name="city" class="selects">
								</select>   
								<select id="s_county" name="district" class="selects">
								</select>
								
								<script class="resources library" src="${pageContext.request.contextPath}/js/area.js"
									type="text/javascript"></script>

								<script type="text/javascript">_init_area();</script>
							</div>
							<div id="show"></div>
							<script type="text/javascript">
                                      var Gid  = document.getElementById ;
                                      var showArea = function(){
                                          Gid('show').innerHTML = "<h3>省" + Gid('s_province').value + " - 市" + 	
                                          Gid('s_city').value + " - 县/区" + 
                                          Gid('s_county').value + "</h3>"
                                                                  }
                                      Gid('s_county').setAttribute('onchange','showArea()');
                              </script>
						</dd>
					</dl>
					<dl>
						<dt>兴趣爱好：</dt>
						<dd>
							<textarea name="aihao" cols="" rows="" class="aihao"
								placeholder="不同项目之间用空格分开，例如“旅行 阅读 瑜伽"></textarea>
						</dd>
					</dl>
					<dl>
						<dt>自我介绍：</dt>
						<dd>
							<textarea name="jieshao" cols="" rows="" class="jieshao"
								placeholder=""></textarea>
						</dd>
					</dl>
					<dl>
						<dt></dt>
						<dd>
							<input name="save_xx" type="submit" class="save_xx"
								value="保存基本信息" />
						</dd>
					</dl>
				</div>
			</form>
		</div>



	</div>

</body>
</html>