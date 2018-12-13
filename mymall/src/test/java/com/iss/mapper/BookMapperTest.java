package com.iss.mapper;

import static org.junit.Assert.*;

import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.iss.pojo.Book;
import com.iss.vo.title_sort_data;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:ApplicationContext-dao.xml")
public class BookMapperTest {

	@Autowired
	private BookMapper mapper;

	//测试最新上架前七位
	@Test
	public void testSelectBooksByTime() {
		List<Book> list = mapper.selectBooksByTime();
		System.out.println(list);
	}

	//测试热销前七名
	@Test
	public void testSelectBooksBySold() {
		List<Book> list = mapper.selectBooksBySold();
		System.out.println(list);
	}

	//测试折扣前10名
	@Test
	public void testSelectBooksByDiscount() {
		List<Book> list = mapper.selectBooksByDiscount();
		System.out.println(list);
	}
	
	//测试按专业分类前10名
	@Test
	public void testSelectBooksBySpecialty(){
		List<Book> list = mapper.selectBooksBySpecialty();
		System.out.println(list);
	}
	
	
	@Test
	public List<Book> selectAllBookByGrade(int grade) {

		List<Book> books = mapper.selectAllBookByGrade(grade);

		return books;
	}

	@Test
	public List<Book> selectALLClassBysp(int Class) {
		List<Book> books = mapper.selectAllBookBysp(Class);

		return books;
	}

	@Test
	public List<Book> selectAndSort(Book book) {
		List<Book> list = mapper.selectAndSort(book);

		return list;
	}

	@Test
	public List<Book> selectAndSort2(Book book) {
		List<Book> list = mapper.selectAndSort2(book);

		return list;
	}

	@Test
	public List<Book> sortByKey(String bing) {
		List<Book> list = mapper.sortByKey(bing);

		return list;
	}

	@Test
	public List<Book> sortByKeySort1(title_sort_data data) {
		List<Book> list = mapper.sortByKey1(data);

		return list;
	}

	@Test
	public List<Book> sortByKeySort2(title_sort_data data) {
		List<Book> list = mapper.sortByKey2(data);

		return list;
	}
	
	

}
