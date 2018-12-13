package com.iss.mapper;

import java.util.List;

import com.iss.pojo.Book;
import com.iss.vo.title_sort_data;

public interface BookMapper {
    int deleteByPrimaryKey(String bid);

    int insert(Book record);

    int insertSelective(Book record);

    Book selectByPrimaryKey(String bid);

    int updateByPrimaryKeySelective(Book record);

    int updateByPrimaryKey(Book record);
    //最新上架前七位
    List<Book> selectBooksByTime();
    //热销排行前七位
    List<Book> selectBooksBySold();
    //折扣最高的前10位
    List<Book> selectBooksByDiscount();
    //每个专业中销售数量前10位
    List<Book> selectBooksBySpecialty();
    
    List<Book> selectAllBookByGrade(int grade);
    
    List<Book> selectAllBookBysp(int specialty);
    
    List<Book> selectAndSort(Book book);
    
    List<Book> selectAndSort2(Book book);
    
    List<Book> sortByKey(String bid);
    
    List<Book> sortByKey1(title_sort_data data);
   
    
    List<Book> sortByKey2(title_sort_data data);
}