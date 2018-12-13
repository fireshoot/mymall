<%@ page language="java" import="com.iss.pojo.Question" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>找回密码2</title>
<link href="${pageContext.request.contextPath}/css/style.css" type="text/css" rel="stylesheet" />
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
             <div class="password_b1 bg2">
                   <ul>                                                        
                       <li>1、输入用户名</li>
                       <li>2、回答密保问题</li>
                       <li>3、重设密码</li>
                       <li>4、密码重设成功</li>
                   </ul>
             </div>
             <div class="password_bc">
                  
                  
                 
                  <form action="${pageContext.request.contextPath}/customer/password2.action" method="post">
                  <div class="password_bc2">
                    <div style="color: red;">${errMsg }</div>
                  <%Question q=(Question)session.getAttribute("question");
                  out.print("<div class='password_bc2t'>"+"问题一："+q.getQuestion1()+"?"+"</div>");
                  %>
                       <div class="password_bc2b"><input type="text" name="answer1" class="password_bc2btxt"></div>
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