package com.iss.mapper;

import org.apache.ibatis.annotations.Param;

import com.iss.pojo.Collect;

public interface CollectMapper {
    int deleteByPrimaryKey(Integer collectId);

    int insert(Collect record);

    int insertSelective(Collect record);

    Collect selectByPrimaryKey(Integer collectId);
    
    Collect selectByBidAndCid(@Param("collect_bookid")Integer collect_bookid,@Param("collect_userid")Integer collect_userid);

    int updateByPrimaryKeySelective(Collect record);

    int updateByPrimaryKey(Collect record);
}