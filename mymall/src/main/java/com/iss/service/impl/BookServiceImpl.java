package com.iss.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iss.mapper.BookMapper;
import com.iss.mapper.CommentMapper;
import com.iss.pojo.Book;
import com.iss.pojo.Comment;
import com.iss.service.IBookService;
import com.iss.vo.IndexBooksVo;
import com.iss.vo.title_sort_data;

@Service
public class BookServiceImpl implements IBookService {

	@Autowired
	private BookMapper bookMapper;
	
	@Autowired
	private CommentMapper commentMapper;

	/**
	 * 查询首页需要的书籍信息
	 */

	@Override
	public Book selectBookDatailByid(String id) {
		Book book = bookMapper.selectByPrimaryKey(id);
		return book;
	}

	@Override
	public IndexBooksVo selectIndexBooks() throws Exception {
		// 今日特价
		List<Book> dailySpecial = bookMapper.selectBooksByDiscount();
		// 热销排行
		List<Book> hotSold = bookMapper.selectBooksBySold();
		// 热门推荐
		List<Book> hotRecommend = bookMapper.selectBooksBySpecialty();
		// 新书上架
		List<Book> newBooks = bookMapper.selectBooksByTime();
		// 包装首页需要的数据
		IndexBooksVo books = new IndexBooksVo();
		books.setDailySpecial(dailySpecial);
		books.setHotRecommend(hotRecommend);
		books.setHotSold(hotSold);
		books.setNewBooks(newBooks);
		return books;
	}

	@Override
	public List<Book> selectAllBookByGrade(int grade) {

		List<Book> books = bookMapper.selectAllBookByGrade(grade);

		return books;
	}

	@Override
	public List<Book> selectALLClassBysp(int Class) {
		List<Book> books = bookMapper.selectAllBookBysp(Class);

		return books;
	}

	@Override
	public List<Book> selectAndSort(Book book) {
		List<Book> list = bookMapper.selectAndSort(book);

		return list;
	}

	@Override
	public List<Book> selectAndSort2(Book book) {
		List<Book> list = bookMapper.selectAndSort2(book);

		return list;
	}

	@Override
	public List<Book> sortByKey(String bing) {
		List<Book> list = bookMapper.sortByKey(bing);

		return list;
	}

	@Override
	public List<Book> sortByKeySort1(title_sort_data data) {
		List<Book> list = bookMapper.sortByKey1(data);

		return list;
	}

	@Override
	public List<Book> sortByKeySort2(title_sort_data data) {
		List<Book> list = bookMapper.sortByKey2(data);

		return list;
	}

	@Override
	public List<Comment> selectComments(String bid) {
		List<Comment> comments=commentMapper.selectByBid(bid);
				
		return comments;
	}

}
