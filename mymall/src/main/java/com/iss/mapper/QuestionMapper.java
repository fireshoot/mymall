package com.iss.mapper;

import com.iss.pojo.Question;

public interface QuestionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Question record);

    int insertSelective(Question record);

    Question selectByPrimaryKey(Integer id);
    
    Question selectByName(String cname);

    int updateByPrimaryKeySelective(Question record);

    int updateByPrimaryKey(Question record);
}