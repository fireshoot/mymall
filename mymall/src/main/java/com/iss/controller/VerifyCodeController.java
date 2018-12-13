package com.iss.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iss.utils.VeriCodeUtil;

@Controller
public class VerifyCodeController {
	
	@RequestMapping("/getVcode.action")
	public void getVcode(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		//得到验证码图片
		BufferedImage img = VeriCodeUtil.getCodePic(120, 30, 200, 250);
		//得到验证码字符串
		String vcode = VeriCodeUtil.getCode();
		//将vcode存到session中,方便后续登录的比对
		req.getSession().setAttribute("vcode", vcode);
		ServletOutputStream outputStream = resp.getOutputStream();
		//将img图片以jpg类型通过outputStream流写到页面的请求处
		ImageIO.write(img, "jpg", outputStream);
	}

}
