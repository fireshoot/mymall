package com.iss.utils;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.util.Random;

/**
 * @Description: 验证码生成工具
 * @Version:1.0
 * @author nick
 * @date 2018年5月25日
 */
public class VeriCodeUtil {
	private static String verifyCode = "";

	/**
	 * @param width:表示图片的宽度
	 * @param height:表示图片的高度
	 * @param fc:表示变化的颜色区间
	 * @param bc:表示基础颜色
	 */

	public static BufferedImage getCodePic(int width, int height, int fc, int bc) {
		// 1.在内存产生一个图片
		BufferedImage codeImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics graphic = codeImg.getGraphics();
		graphic.setColor(getRandColor(fc, bc));
		graphic.fillRect(0, 0, width, height);
		graphic.setColor(Color.WHITE);
		graphic.drawRect(0, 0, width - 1, height - 1);
		Graphics2D graphics2d = (Graphics2D) graphic;
		graphics2d.setFont(new Font("宋体", Font.BOLD, 24));
		String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		Random random = new Random();
		// 定义x坐标
		int x = 10;
		verifyCode = "";
		for (int i = 0; i < 4; i++) {
			graphics2d.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
			int angle = random.nextInt(60) - 30;
			double theta = angle * Math.PI / 180;
			char c = str.charAt(random.nextInt(str.length()));
			graphics2d.rotate(theta, x, 20);
			verifyCode += c;
			graphics2d.drawString(String.valueOf(c), x, 20);
			graphics2d.rotate(-theta, x, 20);
			x += 30;
		}

		graphics2d.setColor(getRandColor(160, 200));
		int x1,x2,y1,y2;
		for (int i = 0; i < 10; i++) {
			x1 = random.nextInt(width-100);
			x2 = random.nextInt(100);
			y1 = random.nextInt(height-10);
			y2 = random.nextInt(10);
			graphics2d.drawLine(x1, y1, x1 + x2, y1 + y2);
		}
		graphics2d.dispose();
		return codeImg;
	}

	public static String getCode() {
		if (verifyCode != null) {
			return verifyCode.trim();
		}
		return null;
	}

	private static Color getRandColor(int fc, int bc) {
		// 取其随机颜色
		Random random = new Random();
		if (fc > 255) {
			fc = 255;
		}
		if (bc > 255) {
			bc = 255;
		}
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}
}