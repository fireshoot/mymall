package com.iss.vo;

import java.util.List;

import com.iss.pojo.Book;
/**
 * @Description: 首页书籍书籍的vo类,用来封装BookController中传到首页的数据
 * @Version:1.0
 * @author nick
 * @date 2018年7月17日
 */
public class IndexBooksVo {
	
	/**
	 * 新书上架
	 */
	private List<Book> newBooks;
	/**
	 * 热门推荐
	 */
	private List<Book> hotRecommend;
	/**
	 * 热销排行
	 */
	private List<Book> hotSold;
	/**
	 * 今日特价
	 */
	private List<Book> dailySpecial;
	
	public List<Book> getNewBooks() {
		return newBooks;
	}
	public void setNewBooks(List<Book> newBooks) {
		this.newBooks = newBooks;
	}
	public List<Book> getHotRecommend() {
		return hotRecommend;
	}
	public void setHotRecommend(List<Book> hotRecommend) {
		this.hotRecommend = hotRecommend;
	}
	public List<Book> getHotSold() {
		return hotSold;
	}
	public void setHotSold(List<Book> hotSold) {
		this.hotSold = hotSold;
	}
	public List<Book> getDailySpecial() {
		return dailySpecial;
	}
	public void setDailySpecial(List<Book> dailySpecial) {
		this.dailySpecial = dailySpecial;
	}
	public IndexBooksVo() {
		super();
	}
	
}
