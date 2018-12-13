package com.iss.vo;

import com.iss.pojo.Book;

public class title_sort_data {
	
	private String key;
	
	private Book book;

	
	
	
	public title_sort_data() {
		super();
	}

	public title_sort_data(String key, Book book) {
		super();
		this.key = key;
		this.book = book;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}
	
	

}
