<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% String path=request.getContextPath(); %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>找回密码4</title>
<link href="${pageContext.request.contextPath}/css/style.css" type="text/css" rel="stylesheet" />
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/question.js"></script>  --%>
<script type="text/javascript" src="<%= path%>/js/question.js"></script>  
</head>

<body class="body_login">
   <div class="login_t">
         <div class="login_logo"><a href="" target="_blank" ></a></div>
       

   </div>
   <div class="zhuce_c">
        <div class="password_t">
             <span class="fr_pw"><a href="" target="_blank">如何找回密码</a></span><span class="zhmm">找回密码</span>
        </div>
        <div class="password_b">
             <div class="password_b1 bg3">
                   <ul>                                                        
                       <li>1、输入用户名</li>
                       <li>2、回答密保问题</li>
                       <li>3、重设密码</li>
                       <li>4、密码重设成功</li>
                   </ul>
             </div>
             <div class="password_bc">
                  <form action="${pageContext.request.contextPath}/customer/password4.action" onsubmit="return checkpsd()" method="post">
                  <div class="password_bc2">
                       <div id="tip_password" style="color: red;"></div>
                       <div class="password_bc2t">请输入您的新密码</div>
                       <div ><input type="password" onblur="checkpsd()" name="password" id="password" class="password_bc2btxt">
                       <span class="zz">密码为6-20的字母或者数字组成</span></div>
                       
                       <div class="password_bc2c"><input  type="submit"  class="pass_next" value="下一步"></div>
                  </div>
                  </form>
                  
             </div>
             
        </div>
   </div>
   <div class="footer_m mar38">
           <div class="footer_nav">
               <a href="" target="_blank">关于我们</a>|
               <a href="" target="_blank">联系我们</a>|
               <a href="" target="_blank">人才招聘</a>|
               <a href="" target="_blank">广告服务</a>|
               <a href="" target="_blank">友情链接</a>|
               <a href="" target="_blank">销售联盟</a>|
               <a href="" target="_blank">公司简介</a>
           </div>
           <div class="footer_copyright">
                网络文化经营许可证鄂网文[2015]0278-060号  Copyright © 2015-2018  版权所有
           </div>
     </div>
</body>

</html>