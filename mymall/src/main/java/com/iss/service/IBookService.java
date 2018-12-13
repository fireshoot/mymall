package com.iss.service;

import java.util.List;

import com.iss.pojo.Book;
import com.iss.pojo.Comment;
import com.iss.vo.IndexBooksVo;
import com.iss.vo.title_sort_data;

public interface IBookService {

	// 查询主页的所有需要的数据
	public IndexBooksVo selectIndexBooks() throws Exception;

	public Book selectBookDatailByid(String id);

	public List<Book> selectAllBookByGrade(int grade);

	public List<Book> selectALLClassBysp(int Class);

	public List<Book> selectAndSort(Book book);// 升序

	public List<Book> selectAndSort2(Book book);// 降序

	public List<Book> sortByKey(String bing);

	public List<Book> sortByKeySort1(title_sort_data data);// 降序

	public List<Book> sortByKeySort2(title_sort_data data);// 降序
	
	public List<Comment> selectComments(String bid);

}
