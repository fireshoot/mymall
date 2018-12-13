package com.iss.mapper;

import com.iss.pojo.Integratebook;

public interface IntegratebookMapper {
    int deleteByPrimaryKey(Integer integratebookId);

    int insert(Integratebook record);

    int insertSelective(Integratebook record);

    Integratebook selectByPrimaryKey(Integer integratebookId);

    int updateByPrimaryKeySelective(Integratebook record);

    int updateByPrimaryKey(Integratebook record);
}