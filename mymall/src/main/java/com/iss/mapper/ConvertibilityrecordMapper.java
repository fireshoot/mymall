package com.iss.mapper;

import com.iss.pojo.Convertibilityrecord;

public interface ConvertibilityrecordMapper {
    int deleteByPrimaryKey(Integer convertibilityrecordId);

    int insert(Convertibilityrecord record);

    int insertSelective(Convertibilityrecord record);

    Convertibilityrecord selectByPrimaryKey(Integer convertibilityrecordId);

    int updateByPrimaryKeySelective(Convertibilityrecord record);

    int updateByPrimaryKey(Convertibilityrecord record);
}